import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Map<String, String> dataInsideFIle = <String, String>{};

Future<File> fileManagerWriteGlobal(final mapAsString) async {
  final file = await localFileAsFavorites;
  final contenidoJsonString = jsonEncode(mapAsString);

  return file.writeAsString(contenidoJsonString);
}

Future readAllFilesAndSaveInMaps() async {
  
  try {

    final readlocalFileAsFavorites = await localFileAsFavorites;

    if (readlocalFileAsFavorites.existsSync()) {
      String contentsFTBIOL = await readlocalFileAsFavorites.readAsString();
      jsonDecode(contentsFTBIOL).forEach((key, value) {
        dataInsideFIle[key] = value as String;
      });
    }
    
  } catch (e) {
    print('Todo mal');
  }
}

Future<File> get localFileAsFavorites async {
  final path = await localPath;
  return File('$path/dataInsideFIle.txt');
}

Future<String> get localPath async {
  Directory? appDocDirectory = await getExternalStorageDirectory();
  final directory = await Directory(appDocDirectory!.path)
      .create(recursive: true);

  return directory.path;
}