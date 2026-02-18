import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class DioRequest{
  final _dio = Dio();
  DioRequest(){
    _dio.options..baseUrl=GlobalConstants.BASE_URL
    ..connectTimeout=Duration(seconds: GlobalConstants.TIME_OUT)
    ..receiveTimeout=Duration(seconds: GlobalConstants.TIME_OUT)
    ..sendTimeout=Duration(seconds: GlobalConstants.TIME_OUT);
    _addInterceptor();
  }
  void _addInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request,handler){
        return handler.next(request);
      },
      onResponse: (response,handler){
        if(response.statusCode! >= 200&&response.statusCode! < 300){
          return handler.next(response);
        }
        handler.reject(DioException(requestOptions: response.requestOptions));
      },
      onError: (error,handler){
        return handler.reject(error);
      }
    ));
  }

  Future<dynamic> get(String url,{Map<String,dynamic>? queryParameters})async{
      try{
        Response response = await _dio.get(url,queryParameters: queryParameters);
        if(response.data["code"]!=GlobalConstants.SUCCESS_CODE){
          return DioException(requestOptions: response.requestOptions);
        }
        return response.data["result"];
      }on DioException catch(e){
        return e;
      }
    }
}

final dioRequest = DioRequest();//dio请求单例