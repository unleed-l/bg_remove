import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BGRemoveAPI {
  final Dio dio;
  final String baseUrl = 'https://api.remove.bg/v1.0/removebg';

  BGRemoveAPI({required this.dio});

  Future<Uint8List?> getRemoveBG(String imgPath) async {
    final apiKey = dotenv.env['api_key'];
    dio.options.headers['X-Api-Key'] = apiKey;

    final response = await dio.post(
      baseUrl,
      data: FormData.fromMap({
        'size': 'auto',
        'image_file':
            await MultipartFile.fromFile(imgPath, filename: 'image_file'),
      }),
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );

    if (response.statusCode == 200) {
      return Uint8List.fromList(response.data);
    } else {
      return null;
    }
  }
}
