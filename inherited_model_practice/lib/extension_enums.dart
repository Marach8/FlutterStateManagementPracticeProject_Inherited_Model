import 'dart:math';

enum AvailableColors{one, two}

extension RandomElement<T> on Iterable<T> {
  T getRadomElement() => elementAt(Random().nextInt(length));
}