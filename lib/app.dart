import 'package:data/datasource/memory_datasource.dart';
import 'package:data/repository/counter_repository_impl.dart';
import 'package:domain/repository/counter_repository.dart';
import 'package:domain/use_case/add_count_use_case.dart';
import 'package:domain/use_case/get_count_use_case.dart';
import 'package:flutter/material.dart';
import 'package:presentation/main_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  // ****************************** LIFECYCLE ****************************** //

  @override
  Widget build(BuildContext context) {
    // Data dependencies.
    final MemoryDatasource memoryDatasource = MemoryDatasource();
    final CounterRepository counterRepository =
        CounterRepositoryImpl(memoryDatasource);

    // Domain dependencies.
    final GetCountUseCase getCountUseCase = GetCountUseCase(counterRepository);
    final AddCountUseCase addCountUseCase = AddCountUseCase(counterRepository);

    // Create app.
    return MultiProvider(
      providers: [
        Provider<GetCountUseCase>.value(value: getCountUseCase),
        Provider<AddCountUseCase>.value(value: addCountUseCase),
      ],
      child: MaterialApp(
        title: 'Counter app [MVVM + Clean]',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}
