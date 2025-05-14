import 'package:counter_app/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Class -', () {
    late Counter counter;
    setUp(() {
      counter = Counter();
    });

    test(
      'given Counter class when it is instantiated then value of count should be 0',
      () {
        //Act
        final val = counter.count;

        //Assert
        expect(val, 0);
      },
    );

    test(
      'given Counter class when it is inscremented then value of count should be 1',
      () {
        //Act
        counter.counterIncremented();
        final val = counter.count;

        //Assert
        expect(val, 1);
      },
    );

    test(
      'given Counter class when it is decremented then value of count should be -1',
      () {
        //Act
        counter.counterDecremented();
        final val = counter.count;

        //Assert
        expect(val, -1);
      },
    );

    test(
      'given Counter class when it is reset then value of count should be 0',
      () {
        //Act
        counter.counterReset();
        final val = counter.count;

        //Assert
        expect(val, 0);
      },
    );
  });
}
