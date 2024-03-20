import 'package:dio/dio.dart';

class AppApis {
  String baseUrl = "http://coding-assignment.bombayrunning.com";

  getData() async {
    var dio = Dio();
    var response = await dio.request("$baseUrl/data.json",
        options: Options(
          method: 'GET',
        ));
        
    return response;
  }
}
