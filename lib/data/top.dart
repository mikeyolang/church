import 'package:church/data/one.dart';

List<Money> geter_top() {
  Money snapFood = Money();
  snapFood.time = 'jan 30,2022';
  snapFood.image = 'mac.jpg';
  snapFood.buy = true;
  snapFood.fee = '- \$ 100';
  snapFood.name = 'macdonald';
  Money snap = Money();
  snap.image = 'cre.png';
  snap.time = 'today';
  snap.buy = true;
  snap.name = 'Transfer';
  snap.fee = '- \$ 60';

  return [snapFood, snap];
}
