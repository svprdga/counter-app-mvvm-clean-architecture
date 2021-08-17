import 'package:data/datasource/memory_datasource.dart';
import 'package:domain/model/count.dart';
import 'package:domain/repository/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {

  // ***************************** INJECTED VARS *************************** //

  final MemoryDatasource _memoryDatasource;

  // ***************************** CONSTRUCTORS **************************** //

  CounterRepositoryImpl(this._memoryDatasource);

  //***************************** PUBLIC METHODS *************************** //

  @override
  Future<Count> getCount() async {
    final currCount = _memoryDatasource.count;
    return Count(currentCount: currCount);
  }

  @override
  void setCount(Count count) {
    _memoryDatasource.count = count.currentCount;
  }
}