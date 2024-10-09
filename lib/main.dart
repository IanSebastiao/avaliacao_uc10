import 'package:flutter/material.dart';

import 'pages/app_vida_page.dart';

void main() {
  runApp(const AppVida());
}

class AppVida extends StatelessWidget {
  const AppVida({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppVidaPage(),
    );
  }
}
