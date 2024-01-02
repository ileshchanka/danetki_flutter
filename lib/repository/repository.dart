import 'package:danetki_flutter/models/danetka.dart';
import 'package:dio/dio.dart';

import 'abstract_repository.dart';

class DanetkiRepository implements AbstractDanetkiRepository {
  @override
  Future<List<Danetka>> getList() async {
    final response = await Dio().get('https://run.mocky.io/v3/54ef8cd4-5970-46bf-9f96-307b924fefe2');

    final dataList = response.data['danetkiList'] as List;
    final result = dataList.map((e) => Danetka(e['title'], e['question'], e['answer'])).toList();
    return result;
  }
}
