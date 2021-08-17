import 'package:domain/core/base_use_case.dart';
import 'package:domain/model/count.dart';
import 'package:domain/repository/counter_repository.dart';

class GetCountUseCase implements NoParamsUseCase<Count> {
  // ***************************** INJECTED VARS *************************** //

  final CounterRepository _counterRepository;

  // ***************************** CONSTRUCTORS **************************** //

  GetCountUseCase(this._counterRepository);

  //***************************** PUBLIC METHODS *************************** //

  @override
  Future<Count> execute() async {
    return _counterRepository.getCount();
  }
}
