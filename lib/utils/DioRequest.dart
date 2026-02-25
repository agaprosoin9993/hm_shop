import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/stores/TokenManager.dart';

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
        //注入token request header Authorization = "Bearer token"
        if(tokenManager.getToken().isNotEmpty){
          request.headers={
          "Authorization": "Bearer ${tokenManager.getToken()}"};
        }
        return handler.next(request);
      },
      onResponse: (response,handler){
        if(response.statusCode! >= 200&&response.statusCode! < 300){
          return handler.next(response);
        }
        handler.reject(DioException(requestOptions: response.requestOptions));
      },
      onError: (error,handler){
        handler.reject(DioException(requestOptions: error.requestOptions,
          message: error.response?.data["message"] ?? " "));
      }
    ));
  }

  Future<dynamic> get(String url,{Map<String,dynamic>? queryParameters})async{
    return _handleResponse(_dio.get(url,queryParameters: queryParameters));
    }
  Future<dynamic> post(String url,{Map<String,dynamic>? data}) async {
    return _handleResponse(_dio.post(url,data: data));
  }
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task)async{
    try{
      Response<dynamic> res =await task;
      final data = res.data as Map<String,dynamic>;
      print("Response data: $data");
      print("Response code: ${data['code']}");
      print("Response msg: ${data['msg']}");
      print("Response result: ${data['result']}");
      if(data["code"]==GlobalConstants.SUCCESS_CODE || data["code"]==int.tryParse(GlobalConstants.SUCCESS_CODE)){
        return data["result"];
      }
      throw DioException(requestOptions: res.requestOptions,
        message: data["msg"] ?? "加载数据失败",
      );
    }catch(e){
      rethrow;
    }
  }
}

final dioRequest = DioRequest();//dio请求单例