import 'package:flutter/material.dart';
import 'package:glassfy_purchases_app_example_flutter/page/consumable_page.dart';
import 'package:glassfy_purchases_app_example_flutter/page/subscription_page.dart';
import 'package:provider/provider.dart';

import 'api/purchase_api.dart';
import 'provider/glassfy_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PurchaseApi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlassfyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.deepOrange,
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              textStyle: const TextStyle(fontSize: 20),
              minimumSize: const Size.fromHeight(50),
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final children = [
    const SubscriptionPage(),
    const ConsumablePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchases'),
        centerTitle: true,
      ),
      body: children[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Consumable',
          ),
        ],
      ),
    );
  }
}
