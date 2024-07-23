import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokuwear/repository/ssdp_repository.dart';
import 'package:rokuwear/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roku Wear',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<SsdpRepository>(create: (_) => SsdpRepository()),
        ],
        child: const Home(),
      ),
    );
  }
}
