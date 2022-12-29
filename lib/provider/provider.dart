import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppProvider with ChangeNotifier {
  String? descClock;
  Timer? timer;
  void clock() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      descClock = DateFormat('hh:mm').format(DateTime.now());

      notifyListeners();
    });
  }
}
