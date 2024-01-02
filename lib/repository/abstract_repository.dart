import '../models/danetka.dart';

abstract class AbstractDanetkiRepository {
  Future<List<Danetka>> getList();
}
