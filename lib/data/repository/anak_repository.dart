import 'dart:convert';

import 'package:carnary/data/model/request/admin/anak_request_model.dart';
import 'package:carnary/data/model/response/get_all_anak_response.dart';
import 'package:carnary/service/service_http_client.dart';
import 'package:dartz/dartz.dart';

class AnakRepository {
  final ServiceHttpClient _serviceHttpClient;
  AnakRepository(this._serviceHttpClient);

  Future<Either<String, GetAnakById>> addAnak(AnakRequestModel requestModel) async{
    try{
      final response = await _serviceHttpClient.postWithToken("admin/anak", requestModel.toMap());
      
       if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final profileResponse = GetAnakById.fromJson(jsonResponse);
        return Right(profileResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      return Left("An error occurred while adding induk : $e");
    }
  }

  Future<Either<String, GetAllAnakModel>> getAllInduk() async{
    try {
      final response = await _serviceHttpClient.get("admin/induk");

      if(response.statusCode == 200){
        final jsnoResponse = json.decode(response.body);
        final profileResponse = GetAllAnakModel.fromJson(jsnoResponse);
        return Right(profileResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      return Left("An error occurred while adding induk : $e");
    }
  }
}
