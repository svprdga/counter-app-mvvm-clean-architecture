import 'package:domain/model/count.dart';

abstract class CounterRepository {
  Future<Count> getCount();

  void setCount(Count count);
}
