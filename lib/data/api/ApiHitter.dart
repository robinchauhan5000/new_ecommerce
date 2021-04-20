import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'ApiEndPoint.dart';

class ApiHitter {
  static Dio _dio;
// final repo = LogoutRepo();
  final GlobalKey key = new GlobalKey();
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  static Dio getDio() {
    if (_dio == null) {
      BaseOptions options = new BaseOptions(
          baseUrl: ApiEndpoint.BaseUrl,
          connectTimeout: 300000,
          receiveTimeout: 300000);

      return new Dio(options)
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
          print(options.data);
          return options;
        }, onResponse: (Response response) {
          return response; // continue
        }, onError: (DioError e) {
          return e;
        }));
    } else {
      return _dio;
    }
  }

  Future<ApiResponse> getPostApiResponse(String endPoint,
      {BuildContext context,
      Map<String, dynamic> headers,
      Map<String, dynamic> data,
      FormData formdata,
      bool isformdata = false}) async {
    try {
      var response = await getDio().post(endPoint,
          options: Options(headers: headers),
          data: isformdata ? formdata : data,
          onSendProgress: (int sent, int total) {});
      String b = "422";
      String a = response.data['status'].toString();
      String message = "Token is not valid";
      String errorMessage = response.data['errors'].toString();
      print("errorMessage" + response.statusMessage.toString());
      if (a == b) {
        if (message == errorMessage) {
          this._memoizer.runOnce(() async {
            await Future.delayed(Duration(milliseconds: 750), () {});
          });
        }
      }
      return ApiResponse(true, response: response, msg: response.data["msg"]);
    } catch (error, stacktrace) {
      try {
        return ApiResponse(false,
            msg:
                "${error?.response?.data["msg"] ?? "Sorry Something went wrong."}");
      } catch (e) {
        print("222");
        return ApiResponse(false, msg: error?.response?.data["msg"]);
      }
    }
  }

  Future<ApiResponse> getPutApiResponse(String endPoint,
      {BuildContext context,
      Map<String, dynamic> headers,
      Map<String, dynamic> data,
      FormData formdata,
      bool isformdata = false}) async {
    try {
      var response = await getDio().put(endPoint,
          options: Options(headers: headers),
          data: isformdata ? formdata : data,
          onSendProgress: (int sent, int total) {});
      String b = "422";
      String a = response.data['status'].toString();
      String message = "Token is not valid";
      String errorMessage = response.data['errors'].toString();
      print("errorMessage" + response.statusMessage.toString());
      if (a == b) {
        if (message == errorMessage) {
          this._memoizer.runOnce(() async {
            await Future.delayed(Duration(milliseconds: 750), () {});
          });
        }
      }
      return ApiResponse(true, response: response, msg: response.data["msg"]);
    } catch (error, stacktrace) {
      try {
        return ApiResponse(false,
            msg:
                "${error?.response?.data["msg"] ?? "Sorry Something went wrong."}");
      } catch (e) {
        print("222");
        return ApiResponse(false, msg: error?.response?.data["msg"]);
      }
    }
  }
}

class ApiResponse {
  final bool status;
  final String msg;
  final Response response;

  ApiResponse(this.status, {this.msg = "Success", this.response});
}
