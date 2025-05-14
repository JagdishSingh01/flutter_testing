class Counter {
  int _counter = 0;
  int get count => _counter;

  void counterIncremented() {
    _counter++;
  }

  void counterDecremented() {
    _counter--;
  }

  void counterReset() {
    _counter = 0;
  }
}
