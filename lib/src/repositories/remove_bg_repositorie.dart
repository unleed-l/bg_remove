import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

class BGRemoveAPI {
  final Dio dio;
  final String baseUrl = 'https://api.remove.bg/v1.0/removebg';

  BGRemoveAPI({required this.dio});

  Future<XFile?> getRemoveBG(String imgPath) async {
    final apiKey = dotenv.env['api_key'];
    final response = await dio.post(
      baseUrl,
      data: FormData.fromMap({
        'image_url': await MultipartFile.fromFile(imgPath),
      }),
      options: Options(headers: {'X-API-Key:': apiKey}),
    );

    if (response.statusCode == 200) {
      return XFile.fromData(response.data);
    } else {
      throw 'Ocorreu um erro ao remover o fundo da imagem';
    }
  }
}
