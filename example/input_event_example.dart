import 'dart:isolate';

import 'package:input_event/input_event.dart';

void main() {
  // Replace this with something else...
  final deviceFile = "/dev/input/event4";

  Isolate.run(() {
    while (true) {}
  });

  // This will receive all events from the device file
  final events = InputEventController(deviceFile);
  events.eventStream.stream.listen((data) {
    print(data);
  });
}
