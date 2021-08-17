import 'package:domain/use_case/get_count_use_case.dart';
import 'package:domain/use_case/add_count_use_case.dart';
import 'package:flutter/material.dart';
import 'package:presentation/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ********************************* VARS ******************************** //

  late final MainViewModel _viewModel;

  // ****************************** LIFECYCLE ****************************** //

  @override
  void initState() {
    super.initState();

    _viewModel = MainViewModel(
        Provider.of<GetCountUseCase>(context, listen: false),
        Provider.of<AddCountUseCase>(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _viewModel,
        child: Consumer<MainViewModel>(
          builder: (context, bloc, child) => Scaffold(
            appBar: AppBar(
              title: const Text('Counter App [MVVM + Clean]'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${_viewModel.count}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _viewModel.addCount,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ));
  }
}
