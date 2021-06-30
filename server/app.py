import io
import json
import os
import shutil
from datetime import datetime

import torchvision.models as models
import torchvision.transforms as transforms
from PIL import Image
from flask import Flask, jsonify, request


app = Flask(__name__)
model = models.densenet121(pretrained=True)               # Trained on 1000 classes from ImageNet
model.eval()                                              # Turns off autograd and



img_class_map = None
mapping_file_path = 'index_to_name.json'                  # Human-readable names for Imagenet classes
if os.path.isfile(mapping_file_path):
    with open (mapping_file_path) as f:
        img_class_map = json.load(f)



@app.route('/test', methods=['GET'])
def test():
    return "Je vous emmerde et je rentre à ma maison !"


# Transform input into the form our model expects
def transform_image(infile):
    input_transforms = [transforms.Resize(255),           # We use multiple TorchVision transforms to ready the image
        transforms.CenterCrop(224),
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406],       # Standard normalization for ImageNet model input
            [0.229, 0.224, 0.225])]
    my_transforms = transforms.Compose(input_transforms)
    image = Image.open(infile)                            # Open the image file
    timg = my_transforms(image)                           # Transform PIL image to appropriately-shaped PyTorch tensor
    timg.unsqueeze_(0)                                    # PyTorch models expect batched input; create a batch of 1
    return timg


# Get a prediction
def get_prediction(input_tensor):
    outputs = model.forward(input_tensor)                 # Get likelihoods for all ImageNet classes
    _, y_hat = outputs.max(1)                             # Extract the most likely class
    prediction = y_hat.item()                             # Extract the int value from the PyTorch tensor
    return prediction

# Make the prediction human-readable
def render_prediction(prediction_idx):
    stridx = str(prediction_idx)
    class_name = 'Unknown'
    if img_class_map is not None:
        if stridx in img_class_map is not None:
            class_name = img_class_map[stridx][1]

    return prediction_idx, class_name


@app.route('/', methods=['GET'])
def root():
    return jsonify({'msg' : 'Try POSTing to the /predict endpoint with an RGB image attachment'})


@app.route('/predict', methods=['POST'])
def predict():
    if request.method == 'POST':
        if os.path.exists("/home/artichteam/artich/runs/detect/exp"):
            shutil.rmtree("/home/artichteam/artich/runs/detect/exp")  
        file = request.files['file']
        image_name = str(datetime.timestamp(datetime.now())) + ".jpg"
        image_path = os.path.join("/home/artichteam/artich/", "runs", "detect", "exp", image_name)
        #image_path = os.path.join(os.getcwd(), image_name)
        print(image_path)
        file.save("test.jpg")
        print("avant")
        os.system("python3 /home/artichteam/artich/detect.py --save-txt --weights /home/artichteam/artich/best.pt --img 832 --conf 0.4 --source /home/artichteam/artich/test.jpg ")
        print("apres")
        file_label = open('/home/artichteam/artich/runs/detect/exp/labels/test.txt', 'r')
        #file_label = open('/home/artichteam/artich/test.txt', 'r')
        nb_boites = len(file_label.readlines())
        print("Le nombre de boite est de : " + str(nb_boites) )
        if file is not None:
            input_tensor = transform_image(file)
            prediction_idx = get_prediction(input_tensor)
            class_id, class_name = render_prediction(prediction_idx)
            return jsonify({'class_id': class_id, 'class_name': class_name, 'nb_billons': nb_boites, "image_name" : image_name })
            #return jsonify({"nb_billons": nb_boites})

if __name__ == '__main__':
    app.run()
