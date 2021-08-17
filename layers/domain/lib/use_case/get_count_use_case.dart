import 'package:counter_app_domain/core/base_use_case.dart';
import 'package:counter_app_domain/repository/counter_repository.dart';

class GetCountUseCase<Count> extends NoParamsUseCase<Count> {
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
