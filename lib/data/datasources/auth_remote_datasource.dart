import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_deptech_app/data/models/request/login_request_model.dart';
import 'package:flutter_deptech_app/data/models/request/register_request_model.dart';
import 'package:flutter_deptech_app/data/models/request/user_request_model.dart';
import 'package:flutter_deptech_app/data/models/response/image_response_model.dart';
import 'package:flutter_deptech_app/data/models/response/user_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/response/auth_response_model.dart';
import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  // Register
  Future<Either<String, AuthResponse>> register(RegisterRequest register) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(register.toJson());
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: headers,
      body: body,
    );
    log('Response Register : ${response.body}');

    if (response.statusCode == 200) {
      final authResponse = AuthResponse.fromRawJson(response.body);
      if (authResponse.token != null) {
        await AuthLocalDatasource().saveAuthData(authResponse);
        return Right(authResponse);
      } else {
        log('Token is null in response');
        return const Left('Token is null');
      }
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }

  // Login
  Future<Either<String, AuthResponse>> login(LoginRequest login) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(login.toJson());
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: headers,
      body: body,
    );
    log('Response login : ${response.body}');

    if (response.statusCode == 200) {
      final authResponse = AuthResponse.fromRawJson(response.body);
      if (authResponse.token != null) {
        await AuthLocalDatasource().saveAuthData(authResponse);
        return Right(authResponse);
      } else {
        log('Token is null in response');
        return const Left('Token is null');
      }
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }

  // Logout
  Future<Either<String, String>> logout() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: headers,
    );

    log('Response Logout : ${response.body}');

    if (response.statusCode == 200) {
      await AuthLocalDatasource().removeAuthData();
      final successMessage = jsonDecode(response.body)['message'];
      return Right(successMessage);
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }

  // Get User
  Future<Either<String, UserResponse>> fetchUser() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/user'),
      headers: headers,
    );
    log('Response Get User : ${response.body}');

    if (response.statusCode == 200) {
      return Right(UserResponse.fromRawJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }

  // Update user
  Future<Either<String, UserResponse>> updateUser(UserRequest user) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode(user.toJson());
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/user/update-profile'),
      headers: headers,
      body: body,
    );
    log('Response Update User : ${response.body}');

    if (response.statusCode == 200) {
      return Right(UserResponse.fromRawJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }

  // Update Photo
  Future<Either<String, ImageResponse>> uploadPhoto(File imageFile) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${Variables.baseUrl}/api/user/upload-photo'),
    );
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('profile_picture', imageFile.path));
    // Send the request
    final response = await request.send();

    // Get response body
    final responseBody = await response.stream.bytesToString();

    log('Response Upload Photo : $responseBody');
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(responseBody);
      return Right(ImageResponse.fromJson(jsonResponse));
    } else {
      final errorMessage = jsonDecode(responseBody)['message'];
      return Left(errorMessage);
    }
  }
}
