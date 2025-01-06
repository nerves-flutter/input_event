import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:input_event/src/types.dart';

class InputEventController {
  final String filePath;
  final File deviceFile;
  final StreamController eventStream = StreamController.broadcast();

  InputEventController(this.filePath) : deviceFile = File(filePath) {
    _startListen();
  }

  void _startListen() async {
    if (!deviceFile.existsSync()) {
      throw "Could not open device file $filePath. Input events will not be processed!";
    }

    final fileStream = deviceFile.openRead();

    await for (final rawByteList in fileStream) {
      final eventChunks = rawByteList.slices(24);
      for (final eventBytes in eventChunks) {
        if (eventBytes.length != 24) {
          // Invalid event struct, ignore it
          continue;
        }

        // Parse event data using structured data types
        final data = ByteData.view(Uint8List.fromList(eventBytes).buffer);

        // Stucture of event data is:
        //   * 16 bytes for a timespan struct (ignored for now)
        //   * 2 bytes for type
        //   * 2 bytes for code
        //   * 4 bytes for values
        // 24 bytes total
        final rawType = data.getUint16(16, Endian.little);
        final rawCode = data.getUint16(18, Endian.little);
        final rawValue = data.getUint32(20, Endian.little);

        final eventType = InputEventType.fromInt(rawType);
        final eventCode = parseCode(eventType, rawCode);
        final parsedValue = praseValue(eventType, eventCode, rawValue);

        // TODO: We return "max" if we can't currently parse the event type
        // we only care about keyboard events for now...
        var event = InputEvent(
            type: eventType,
            code: eventCode ?? InputEventType.max,
            value: parsedValue ?? InputEventType.max,
            timestamp: DateTime.now());

        eventStream.add(event);
      }
    }
  }

  Enum? parseCode(InputEventType type, int rawCode) {
    switch (type) {
      case InputEventType.key:
        return LinuxKeyCode.fromInt(rawCode);
      case InputEventType.syn:
        return SyncEventType.fromInt(rawCode);
      case InputEventType.msc:
        return MscEventType.fromInt(rawCode);
      default:
        // TODO: Properly parse other code types
        return null;
    }
  }

  KeyEventType parseKeyEvent(int value) {
    return KeyEventType.fromInt(value);
  }

  Enum? praseValue(InputEventType type, Enum? code, int rawValue) {
    if (code is LinuxKeyCode) {
      return KeyEventType.fromInt(rawValue);
    }

    return null;
  }
}
