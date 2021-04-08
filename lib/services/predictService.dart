import 'dart:io';

import 'package:articherons/models/ResponseModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

Future<ResponseModel> predictImage(File image) async {
  print("Send image WIP");

  http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse("https://articherons.romainlenoir.fr/predict"));

  request.files.add(
    await http.MultipartFile.fromPath(
      'file',
      image.path,
      contentType: MediaType('application', 'jpeg'),
    ),
  );

  http.StreamedResponse response = await request.send();
  ResponseModel responseModel = ResponseModel.fromJson(jsonDecode(await response.stream.transform(utf8.decoder).join()));

  print("Image traited");

  return responseModel;


/*
  request.files.add(
    await http.MultipartFile.fromPath(
      'file',
      image.path,
      contentType: MediaType('application', 'jpeg'),
    ),
  );

  http.StreamedResponse r = await request.send();
  print(await r.stream.transform(utf8.decoder).join());
  ResponseModel responseModel = json.decode(await r.stream.transform(utf8.decoder).join());
  print("------------------------------");
  //print(responseModel.toString());
  return request.toString();
*/

}