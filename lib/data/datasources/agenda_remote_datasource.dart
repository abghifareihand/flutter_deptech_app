import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_deptech_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_deptech_app/data/models/request/agenda_request_model.dart';
import 'package:flutter_deptech_app/data/models/response/agenda_list_response_model.dart';
import 'package:flutter_deptech_app/data/models/response/agenda_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../core/constants/variables.dart';

class AgendaRemoteDatasource {
  // Get List Agenda
  Future<Either<String, AgendaListResponse>> fetchAgenda() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/agenda'),
      headers: headers,
    );
    log('Response Get User : ${response.body}');

    if (response.statusCode == 200) {
      return Right(AgendaListResponse.fromRawJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }

  // Create Agenda
  Future<Either<String, AgendaResponse>> createAgenda(
    AgendaRequest agenda,
  ) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${Variables.baseUrl}/api/agenda'),
    );
    request.headers.addAll(headers);

    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    request.fields['title'] = agenda.title;
    request.fields['description'] = agenda.description;
    request.fields['event_datetime'] = dateFormat.format(agenda.eventDateTime);
    if (agenda.reminderDateTime != null) {
      request.fields['reminder_datetime'] = dateFormat.format(agenda.reminderDateTime!);
    }
    if (agenda.attachment != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'attachment',
          agenda.attachment!.path,
        ),
      );
    }

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    log('Response Add Agenda : $responseBody');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(responseBody);
      return Right(AgendaResponse.fromJson(jsonResponse));
    } else {
      final errorMessage = jsonDecode(responseBody)['message'];
      return Left(errorMessage);
    }
  }

  // Update Agenda
  Future<Either<String, AgendaResponse>> updateAgenda(int id, String title, String description) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = jsonEncode({
      'title': title,
      'description': description,
    });

    final response = await http.put(
      Uri.parse('${Variables.baseUrl}/api/agenda/$id'),
      headers: headers,
      body: body,
    );

    log('Response Update Agenda : ${response.body}');

    if (response.statusCode == 200) {
      return Right(AgendaResponse.fromRawJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }

  Future<Either<String, String>> deleteAgenda(int id) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.delete(
      Uri.parse('${Variables.baseUrl}/api/agenda/$id'),
      headers: headers,
    );
    log('Response Delete Agenda : ${response.body}');

    if (response.statusCode == 200) {
      final successMessage = jsonDecode(response.body)['message'];
      return Left(successMessage);
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      return Left(errorMessage);
    }
  }
}
