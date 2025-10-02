import 'package:flutter/material.dart';
import 'package:frames_design/app.dart';
 import 'package:provider/provider.dart';
 import 'package:frames_design/provider/product_provider.dart';
 void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const App(),
    ),
  );
 }
 