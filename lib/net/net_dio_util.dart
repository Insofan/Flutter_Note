import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

/// 返回data
class BaseResp<T> {
  String status;
  int code;
  String msg;
  T data;

  BaseResp(this.status, this.code, this.msg, this.data);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

/// <BaseRespR<T> 返回 status code msg data Response.
/// 返回 response
class BaseRespR<T> {
  String status;
  int code;
  String msg;
  T data;
  Response response;

  BaseRespR(this.status, this.code, this.msg, this.data, this.response);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    this.status,
    this.code,
    this.msg,
    this.data,
    this.options,
  });

  String status;

  String code;

  String msg;

  String data;

  BaseOptions options;
}

class DioUtil {
  static final DioUtil _singleton = DioUtil._init();
  static Dio _dio;

  /// BaseResp [String status]字段 key, 默认：status.
  String _statusKey = "status";

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String _codeKey = "errorCode";

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String _msgKey = "errorMsg";

  /// BaseResp [T data]字段 key, 默认：data.
  String _dataKey = "data";

  /// Options.
  /// BaseOptions 与 Options 区别, BaseOptions用来初始化_dio, Options是用来设置每一次请求
  BaseOptions _options = getDefOptions();

  /// 是否是debug模式.
  static bool _isDebug = false;

  static DioUtil getInstance() {
    return _singleton;
  }

  /// create new dio.
  static Dio createNewDio([BaseOptions options]) {
    options = options ?? getDefOptions();
    Dio dio = new Dio(options);
    return dio;
  }

  factory DioUtil() {
    return _singleton;
  }

  DioUtil._init() {
    _dio = new Dio(_options);
  }

  /// 打开debug模式.
  static void setDebug() {
    _isDebug = true;
  }

  /// 设置每次请求config
  void setConfig(HttpConfig config) {
    _statusKey = config.status ?? _statusKey;
    _codeKey = config.code ?? _codeKey;
    _msgKey = config.msg ?? _msgKey;
    _dataKey = config.data ?? _dataKey;
    _mergeOption(config.options);
    if (_dio != null) {
      _dio.options = _options;
    }
  }

  void _mergeOption(BaseOptions opt) {
    _options.method = opt.method ?? _options.method;
    _options.headers = (new Map.from(_options.headers)..addAll(opt.headers));
    _options.baseUrl = opt.baseUrl ?? _options.baseUrl;
    _options.connectTimeout = opt.connectTimeout ?? _options.connectTimeout;
    _options.receiveTimeout = opt.receiveTimeout ?? _options.receiveTimeout;
    _options.responseType = opt.responseType ?? _options.responseType;
    _options.extra = (new Map.from(_options.extra))..addAll(opt.extra);
    _options.contentType = opt.contentType ?? _options.contentType;
    _options.validateStatus = opt.validateStatus ?? _options.validateStatus;
    _options.followRedirects = opt.followRedirects ?? _options.followRedirects;
  }

  /// get Def Options.
  static BaseOptions getDefOptions() {
    /// 默认option 设置
    BaseOptions options = new BaseOptions();
    options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    options.connectTimeout = 1000 * 10;
    options.receiveTimeout = 1000 * 20;

    /// 选填
    /// options.sendTimeout = 1000 * 10;
    return options;
  }

  /// <BaseRespR<T> (只返回data的request): 返回 status code msg data .
  Future<BaseResp<T>> request<T>(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Response resp = await _dio.request(path,
        data: data,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    _httpLog(resp);

    String _status;
    int _code;
    String _msg;
    T _data;

    if (resp.statusCode == HttpStatus.ok ||
        resp.statusCode == HttpStatus.created) {
      try {
        if (resp.data is Map) {
          _status = (resp.data[_statusKey] is int)
              ? resp.data[_statusKey].toString()
              : resp.data[_statusKey];

          _code = (resp.data[_codeKey] is String)
              ? int.tryParse(resp.data[_codeKey])
              : resp.data[_codeKey];

          dynamic tmp = resp.data['title'];

          _msg = resp.data[_msgKey];
          _data = resp.data;
        } else {
          Map<String, dynamic> _dataMap = _decodeData(resp);
          _status = (_dataMap[_statusKey] is int)
              ? _dataMap[_statusKey].toString()
              : _dataMap[_statusKey];
          _code = (_dataMap[_codeKey] is String)
              ? int.tryParse(_dataMap[_codeKey])
              : _dataMap[_codeKey];
          _msg = _dataMap[_msgKey];
          _data = _dataMap[_dataKey];
        }
        return new BaseResp(_status, _code, _msg, _data);
      } catch (e) {
        return new Future.error(new DioError(
          response: resp,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: resp,
      message: "statusCode: $resp.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  /// <BaseRespR<T> 返回 status code msg data  Response.
  Future<BaseRespR<T>> requestR<T>(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Response resp = await _dio.request(path,
        data: data,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    _httpLog(resp);
    String _status;
    int _code;
    String _msg;
    T _data;
    if (resp.statusCode == HttpStatus.ok ||
        resp.statusCode == HttpStatus.created) {
      try {
        if (resp.data is Map) {
          _status = (resp.data[_statusKey] is int)
              ? resp.data[_statusKey].toString()
              : resp.data[_statusKey];
          _code = (resp.data[_codeKey] is String)
              ? int.tryParse(resp.data[_codeKey])
              : resp.data[_codeKey];
          _msg = resp.data[_msgKey];
          _data = resp.data[_dataKey];
        } else {
          Map<String, dynamic> _dataMap = _decodeData(resp);
          _status = (_dataMap[_statusKey] is int)
              ? _dataMap[_statusKey].toString()
              : _dataMap[_statusKey];
          _code = (_dataMap[_codeKey] is String)
              ? int.tryParse(_dataMap[_codeKey])
              : _dataMap[_codeKey];
          _msg = _dataMap[_msgKey];
          _data = _dataMap[_dataKey];
        }
        return new BaseRespR(_status, _code, _msg, _data, resp);
      } catch (e) {
        return new Future.error(new DioError(
          response: resp,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: resp,
      message: "statusCode: $resp.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }



  Future<Response> download(urlPath,
      savePath, {
        ProgressCallback onReceiveProgress,
        CancelToken cancelToken,
        data,
        Options options,
      }) {
    return _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        data: data,
        options: options);
  }

  /// check option
  Options _checkOptions(String method, Options options) {
    if (options == null) {
      options = new Options();
    }

    options.method = method;
    return options;
  }

  /// get Options Str.
  String _getOptionsStr(RequestOptions request) {
    return "method: " +
        request.method +
        "  baseUrl: " +
        request.baseUrl +
        "  path: " +
        request.path;
  }

  /// print Data Str.
  void _printDataStr(String tag, Object value) {
    String res = value.toString();
    while (res.isNotEmpty) {
      if (res.length > 512) {
        print("[$tag  ]:   " + res.substring(0, 512));
        res = res.substring(512, res.length);
      } else {
        print("[$tag  ]:   " + res);
        res = "";
      }
    }
  }

  /// 打印网络请求
  void _httpLog(Response resp) {
    if (!_isDebug) {
      return;
    }
    try {
      print("<-----Request Log----->" +
          "\n[statusCode]:   " +
          "\n[request   ]:   " +
          _getOptionsStr(resp.request));

      _printDataStr("reqdata ", resp.request.data);
      _printDataStr("response", resp.data);
    } catch (ex) {
      print("<-----Request Log----->" + "\n Failed......");
    }
  }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response == null ||
        response.data == null ||
        response.data.toString().isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }
}
