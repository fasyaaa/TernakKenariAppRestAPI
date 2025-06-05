import 'dart:convert';
import 'dart:io';

import 'package:carnary/data/model/response/burung_semua_tersedia_model.dart';
import 'package:carnary/service/service_http_client.dart';
import 'package:dartz/dartz.dart';

class GetAllBurungTersediaRepository {
  final ServiceHttpClient _serviceHttpClient;
  GetAllBurungTersediaRepository(this._serviceHttpClient);

  Future<Either<String, BurungSemuaTersediaModel>>
  getAllBurungTersedia() async {
    try {
      final response = await _serviceHttpClient.get(
        'buyer/burung-semua-tersedia',
      );

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final burungTersediaResponse = BurungSemuaTersediaModel.fromJson(
          jsonResponse,
        );
        return Right(burungTersediaResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      if (e is SocketException) {
        return Left("No Internet Connection");
      } else if (e is HttpException) {
        return Left("HTTP error : ${e.message}");
      } else if (e is FormatException) {
        return Left("Invalid response format");
      } else {
      return Left("An unexpected error occured: $e");
      }
    }
  }
}
