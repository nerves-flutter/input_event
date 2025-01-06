class InputEvent {
  final DateTime timestamp;
  final InputEventType type;
  final Enum code;
  final Enum value;

  InputEvent(
      {required this.type,
      required this.code,
      required this.value,
      required this.timestamp});

  @override
  String toString() {
    return "(InputEvent) $type $code $value $timestamp";
  }
}

// Base Event Type
enum InputEventType {
  syn(0x00),
  key(0x01),
  rel(0x02),
  abs(0x03),
  msc(0x04),
  sw(0x05),
  led(0x11),
  snd(0x12),
  rep(0x14),
  ff(0x15),
  pow(0x16),
  ffStatus(0x17),
  max(0x1f),
  cnt(0x20);

  final int value;

  const InputEventType(this.value);

  static InputEventType fromInt(int value) {
    return InputEventType.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw ArgumentError('Invalid value for InputEventType: $value'),
    );
  }

  @override
  String toString() {
    return '$name(0x${value.toRadixString(16).padLeft(2, '0')})';
  }
}

// Synchronization events
enum SyncEventType {
  report(0x00),
  config(0x01),
  mtReport(0x02),
  dropped(0x03),
  max(0xf),
  cnt(0x10);

  final int value;

  const SyncEventType(this.value);

  static SyncEventType fromInt(int value) {
    return SyncEventType.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw ArgumentError('Invalid value for SyncEventType: $value'),
    );
  }

  @override
  String toString() {
    return '$name(0x${value.toRadixString(16).padLeft(2, '0')})';
  }
}

// Misc Events
enum MscEventType {
  serial(0x00),
  pulseled(0x01),
  gesture(0x02),
  raw(0x03),
  scan(0x04),
  timestamp(0x05),
  max(0x07),
  cnt(0x08);

  final int value;

  const MscEventType(this.value);

  static MscEventType fromInt(int value) {
    return MscEventType.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw ArgumentError('Invalid value for MscEventType: $value'),
    );
  }

  @override
  String toString() {
    return '$name(0x${value.toRadixString(16).padLeft(2, '0')})';
  }
}

// Linux Key Event Types
enum KeyEventType {
  pressed(1),
  released(0),
  repeat(2);

  final int value;

  const KeyEventType(this.value);

  static KeyEventType fromInt(int value) {
    return KeyEventType.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw ArgumentError('Invalid value for KeyEventType: $value'),
    );
  }

  @override
  String toString() {
    return '$name(0x${value.toRadixString(16).padLeft(2, '0')})';
  }
}

// Linux Keycodes
enum LinuxKeyCode {
  keyReserved(0),
  keyEsc(1),
  key1(2),
  key2(3),
  key3(4),
  key4(5),
  key5(6),
  key6(7),
  key7(8),
  key8(9),
  key9(10),
  key0(11),
  keyMinus(12),
  keyEqual(13),
  keyBackspace(14),
  keyTab(15),
  keyQ(16),
  keyW(17),
  keyE(18),
  keyR(19),
  keyT(20),
  keyY(21),
  keyU(22),
  keyI(23),
  keyO(24),
  keyP(25),
  keyLeftBrace(26),
  keyRightBrace(27),
  keyEnter(28),
  keyLeftCtrl(29),
  keyA(30),
  keyS(31),
  keyD(32),
  keyF(33),
  keyG(34),
  keyH(35),
  keyJ(36),
  keyK(37),
  keyL(38),
  keySemicolon(39),
  keyApostrophe(40),
  keyGrave(41),
  keyLeftShift(42),
  keyBackslash(43),
  keyZ(44),
  keyX(45),
  keyC(46),
  keyV(47),
  keyB(48),
  keyN(49),
  keyM(50),
  keyComma(51),
  keyDot(52),
  keySlash(53),
  keyRightShift(54),
  keyKpAsterisk(55),
  keyLeftAlt(56),
  keySpace(57),
  keyCapsLock(58),
  keyF1(59),
  keyF2(60),
  keyF3(61),
  keyF4(62),
  keyF5(63),
  keyF6(64),
  keyF7(65),
  keyF8(66),
  keyF9(67),
  keyF10(68),
  keyNumLock(69),
  keyScrollLock(70),
  keyKp7(71),
  keyKp8(72),
  keyKp9(73),
  keyKpMinus(74),
  keyKp4(75),
  keyKp5(76),
  keyKp6(77),
  keyKpPlus(78),
  keyKp1(79),
  keyKp2(80),
  keyKp3(81),
  keyKp0(82),
  keyKpDot(83),
  keyZenkakuHankaku(85),
  key102nd(86),
  keyF11(87),
  keyF12(88),
  keyRo(89),
  keyKatakana(90),
  keyHiragana(91),
  keyHenkan(92),
  keyKatakanaHiragana(93),
  keyMuhenkan(94),
  keyKpJpComma(95),
  keyHangeul(96),
  keyHanja(97),
  keyKpEnter(98),
  keyRightCtrl(99),
  keyKpSlash(100),
  keySysrq(120),
  keyRightAlt(125),
  keyLineFeed(130),
  keyHome(102),
  keyUp(103),
  keyPageUp(104),
  keyLeft(105),
  keyRight(106),
  keyEnd(107),
  keyDown(108),
  keyPageDown(109),
  keyInsert(110),
  keyDelete(111),
  keyMacro(112),
  keyMute(113),
  keyVolumeDown(114),
  keyVolumeUp(115),
  keyPower(116),
  keyKpEqual(117),
  keyKpPlusMinus(118),
  keyPause(119),
  keyScale(120),
  keyKpComma(121),
  keyHangeulAlt(122),
  keyHanjaAlt(123),
  keyLeftMeta(125),
  keyRightMeta(126),
  keyCompose(127);

  final int value;

  const LinuxKeyCode(this.value);

  static LinuxKeyCode fromInt(int value) {
    return LinuxKeyCode.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw ArgumentError('Invalid value for LinuxKeyCode: $value'),
    );
  }

  @override
  String toString() {
    return 'Keycode $name (0x${value.toRadixString(16).padLeft(2, '0')})';
  }
}
