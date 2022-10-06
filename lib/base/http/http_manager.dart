import 'package:dio/dio.dart';

///单例模式
///门面模式
///代理模式
///工厂模式
///建造者模式
///责任链模式
class HttpManager {
  static HttpManager? _instance;

  static late Dio _dio;

  static const String baseUrl = 'http://v.juhe.cn';

  HttpManager._self();

  static HttpManager getInstance() {
    if (_instance == null) {
      _instance = HttpManager._self();
      _initDio();
    }
    return _instance!;
  }

  ///初始化dio
  static void _initDio() {
    _dio = Dio();

    _dio.options = BaseOptions(
      ///配置基础域名
      baseUrl: baseUrl,

      ///链接超时时间(5秒)
      connectTimeout: 5000,

      ///发送超时时间
      sendTimeout: 5000,

      ///读取超时时间
      receiveTimeout: 5000,

      ///链接超时时间
      contentType: Headers.formUrlEncodedContentType,

      ///响应内容类型
      responseType: ResponseType.json,
    );

    ///添加拦截器
    ///拦截请求和响应
    _dio.interceptors.add(CustomInterceptor());
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? parameters, CancelToken? cancelToken}) async {
    final res = await _dio.get(path,
        queryParameters: parameters, cancelToken: cancelToken);
    return res;
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? parameters, CancelToken? cancelToken}) async {
    final res = await _dio.post(path,
        queryParameters: parameters, cancelToken: cancelToken);
    return res;
  }

  Future<Response> put(String path,
      {Map<String, dynamic>? parameters, CancelToken? cancelToken}) async {
    final res = await _dio.put(path,
        queryParameters: parameters, cancelToken: cancelToken);
    return res;
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? parameters, CancelToken? cancelToken}) async {
    final res = await _dio.delete(path,
        queryParameters: parameters, cancelToken: cancelToken);
    return res;
  }
}

///自定义dio拦截器
class CustomInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final map = {'key': 'd4c498f0ddba94aa6cae0673063cec95'};
    print('拦截器 ======>>>>   给请求参数添加key');
    options.queryParameters.addAll(map);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.connectTimeout) {
      print('拦截器 ======>>>>   连接超时错误');
    } else {
      print("拦截器 ======>>>>   接口错误");
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    print(""
        "\n拦截器 ======>>>>   接口响应状态码：${response.statusCode}"
        "\n拦截器 ======>>>>   接口响应内容：${response.data}");
  }
}
