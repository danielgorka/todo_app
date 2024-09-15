import 'dart:io';

import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init(
  settings: TalkerSettings(
    // Disable logging in tests
    enabled: !Platform.environment.containsKey('FLUTTER_TEST'),
  ),
);
