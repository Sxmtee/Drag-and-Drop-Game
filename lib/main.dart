import 'package:draggable/Page/draggable_basic_page.dart';
import 'package:draggable/Page/draggable_text_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    return BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation),
            label: 'Basic',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        });
  }

  Widget buildPages() {
    switch (currentIndex) {
      case 0:
        return const DraggableTextPage();
      case 1:
        return const DraggableBasicPage();
      default:
        return Container();
    }
  }
}
