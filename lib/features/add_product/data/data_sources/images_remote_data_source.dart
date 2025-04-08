import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

abstract class ImagesRemoteDataSource {
  Future<String> uploadImageToCloudNairy({required File imageFile});
}

class ImagesRemoteDataSourceImple implements ImagesRemoteDataSource {
  @override
  Future<String> uploadImageToCloudNairy({required File imageFile}) async{
    String cloudName = 'dl6mi8p1g';
    String uploadPreset = 'flutter_unsigned'; 
    final url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
final request = http.MultipartRequest('POST', url)
  ..fields['upload_preset'] = uploadPreset
  ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));
  final response = await request.send();
   final resStr = await response.stream.bytesToString();
  final data = json.decode(resStr);
  return data['secure_url'];
  }

}
