import 'package:bg_remover/src/app_widget/bg_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const BGRemover());
}
