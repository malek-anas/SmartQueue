import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smartqueue/database/CacheHelper.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://smartqueue2022.online/api/',
        headers: {
          //   'Content-Type': 'application/json',
        },
        responseType: ResponseType.plain,

        //  contentType: 'application/json',
        //   receiveDataWhenStatusError: true,
        //   followRedirects: false,
        // validateStatus: (status) {
        //   return status! < 500;
        // },
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  static Future<Response> postData({
    required String path,
    required data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ' + (CacheHelper.getData(key: 'token') ?? ''),
      //  'Content-Type': 'application/json',
    };
    return await dio.post(
      path,
      data: data,
    );
  }

  static Future<Response> getData({
    required String path,
    String? token,
    FormData,
    data,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ' + (CacheHelper.getData(key: 'token') ?? ''),
      "Content-Type": "application/json",
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> getSearchData(
      {required String path, String? token, String? name, int? year}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': CacheHelper.getData(key: 'token') ?? '',
    };
    return await dio.get(path, queryParameters: {
      'name': name,
      'year': year,
    });
  }
}
