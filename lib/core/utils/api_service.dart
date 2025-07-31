import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String,String>?head,
      String? conttype}) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: conttype,
        headers: head ?? {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }
}
