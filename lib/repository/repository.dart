import 'package:danetki_flutter/models/danetka.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';

import 'abstract_repository.dart';

class DanetkiRepository implements AbstractDanetkiRepository {
  DanetkiRepository({required this.dio, required this.box});

  final Dio dio;
  final Box<Danetka> box;

  @override
  Future<List<Danetka>> getList() async {
    try {
      List<Danetka> danetkiList = await _getListFromAPI();
      await box.putAll({for (var e in danetkiList) e.title: e});
      return danetkiList;
    } catch (e) {
      return box.values.toList();
    }
  }

  Future<List<Danetka>> _getListFromAPI() async {
    final response = await dio.get('https://run.mocky.io/v3/54ef8cd4-5970-46bf-9f96-307b924fefe2');
    final data = response.data['danetkiList'] as List;
    return data.map((e) => Danetka(e['title'], e['question'], e['answer'])).toList();
  }
}
