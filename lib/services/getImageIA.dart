
  
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
  
Future<File> fileFromImageUrl(String imageName) async {
    String url = "http://137.116.242.182:8030/" + imageName;

    print("URRLLLLL = " + url);

    final response = await http.get(Uri.parse(url));

    final documentDirectory = await getApplicationDocumentsDirectory();

    final file = File(join(documentDirectory.path, imageName));

    file.writeAsBytesSync(response.bodyBytes);

    return file;
  }
