import 'package:dio/dio.dart';

class ApiService {
  //dio instance
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://your-keeper.com/keeper/api/",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<Map<String, dynamic>> getHomes() async {
    try {
      final response = await dio.get('home/get_home.php');
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'API request failed');
    }
  }
}
