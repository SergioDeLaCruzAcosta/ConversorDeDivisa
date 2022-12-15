import 'package:flutter/material.dart';
import 'pages/converter_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency converter',
        theme: ThemeData(
        
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: Colors.black)),
          
        ),
        home: const ConverterPage());
  }

 
}
