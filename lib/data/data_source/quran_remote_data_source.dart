import 'package:dio/dio.dart';
import 'package:hafizh/common/const/api_constant.dart';
import 'package:hafizh/data/model/dto/detail_surah_dto.dart';
import 'package:hafizh/data/model/dto/juz_dto.dart';
import 'package:hafizh/data/model/dto/surah_dto.dart';

abstract class QuranRemoteDataSource {
  Future<List<SurahDTO>> getAllSurah();
  Future<DetailSurahDTO> getDetailSurah(int id);
  Future<JuzDTO> getJuz(int id);
}

class QuranRemoteDataSourceImpl extends QuranRemoteDataSource {
  final Dio dio;

  QuranRemoteDataSourceImpl({required this.dio});

  //TODO: change baseUrl according to env
  @override
  Future<List<SurahDTO>> getAllSurah() async {
    try {
      final response = await dio.get('${ApiConstant.baseUrl}surah');
      return SurahResponseDTO.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DetailSurahDTO> getDetailSurah(int id) async {
    try {
      final response = await dio.get('${ApiConstant.baseUrl}surah/$id');
      return DetailSurahResponseDTO.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<JuzDTO> getJuz(int id) async {
    try {
      final response = await dio.get('${ApiConstant.baseUrl}juz/$id');
      return JuzResponseDTO.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }
}
