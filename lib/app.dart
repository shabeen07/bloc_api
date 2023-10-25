
import 'package:bloc_api/pages/product_list.dart';
import 'package:flutter/material.dart';

class MyApp extends MaterialApp{

   MyApp({super.key}) : super(
    title: 'Api Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const ProductList(),
  );

}