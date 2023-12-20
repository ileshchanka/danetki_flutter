import 'package:danetki_flutter/models/danetka.dart';

class DanetkiRepository {
  // Should be real API
  List<Danetka> getList() {
    return list;
  }
}

final list = [
  Danetka(
      0,
      'Случай в баре',
      'subtitle',
      'Мужчина заходит в бар и просит стакан воды, бармен внезапно достаёт ружьё и направляет на мужчину. Мужчина говорит "спасибо" и уходит. ',
      'Человек мучился от икоты и зашёл в ближайший бар выпить воды. Бармен понял, в чём его проблема, и применил испытанное средство – напугать икающего человека. Способ сработал и мужчина поблагодарил его.'),
  Danetka(
      1,
      'В автобусе',
      'subtitle',
      'Катя решила уступить своё место в автобусе вошедшей женщине. Но та очень смутилась и отказалась. Почему?',
      'Маленькая Катя сидела на папиных коленях'),
  Danetka(2, 'test', 'test', 'test', 'test'),
];