import 'dart:isolate';

import 'package:input_event/input_event.dart';

void main() {
  Isolate.run(() {
    while (true) {}
  });

  final events = InputEventController("/dev/input/event4");
  events.eventStream.stream.listen((data) {
    print(data);
  });
}
