import 'package:flutter/foundation.dart';

class Logs {
  static void p(String s){
    if (kDebugMode) {
      print("log: $s");
    }
  }
}