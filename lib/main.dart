import 'package:binance_app/binance_app.dart';
import 'package:binance_app/dependency_injection/app_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(const BinanceApp());
}
