abstract class CounterRepository<Count> {
  Future<Count> getCount();

  Future<void> setCount(Count count);
}
