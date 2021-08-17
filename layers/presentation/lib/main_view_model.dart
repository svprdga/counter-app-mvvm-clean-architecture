import 'package:domain/use_case/get_count_use_case.dart';
import 'package:domain/use_case/add_count_use_case.dart';
import 'package:flutter/widgets.dart';

class MainViewModel extends ChangeNotifier {
  // ***************************** INJECTED VARS *************************** //

  final GetCountUseCase _getCountUseCase;
  final AddCountUseCase _addCountUseCase;

  // ********************************* VARS ******************************** //

  int _count = 0;

  int get count => _count;

  // ***************************** CONSTRUCTORS **************************** //

  MainViewModel(this._getCountUseCase, this._addCountUseCase);

  //***************************** PUBLIC METHODS *************************** //

  Future<void> addCount() async {
    await _addCountUseCase.execute();
    final count = await _getCountUseCase.execute();
    _count = count.currentCount;
    notifyListeners();
  }
}
