import 'package:domain/core/base_use_case.dart';
import 'package:domain/model/count.dart';
import 'package:domain/repository/counter_repository.dart';

class AddCountUseCase implements NoParamsNoResultUseCase {
  // ***************************** INJECTED VARS *************************** //

  final CounterRepository _counterRepository;

  // ***************************** CONSTRUCTORS **************************** //

  AddCountUseCase(this._counterRepository);

  //***************************** PUBLIC METHODS *************************** //

  @override
  Future<void> execute() async {
    final currCount = await _counterRepository.getCount();
    final newCount = Count(currentCount: currCount.currentCount + 1);
    await _counterRepository.setCount(newCount);
  }
}
