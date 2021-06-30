import torch
import os
os.system("cat data.yaml")

# define number of classes based on YAML
import yaml
with open("data.yaml", 'r') as stream:
    num_classes = str(yaml.safe_load(stream)['nc'])
"""
#this is the model configuration
os.system("cat yolov5/models/yolov5s.yaml")

os.system("time")
os.system("cd yolov5/")
os.system("ls")
os.system("python train.py --img 832 --batch 16 --epochs 10 --data '../data.yaml' --cfg ./models/custom_yolov5s.yaml --weights '' --name yolov5s_results  --cache")
   """     
