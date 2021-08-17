import 'package:domain/model/count.dart';

abstract class CounterRepository {
  Future<Count> getCount();

  Future<void> setCount(Count count);
}
