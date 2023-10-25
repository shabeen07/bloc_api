import 'package:bloc_api/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  final bloc = const AppBlocObserver();
  runApp(MyApp());
}
