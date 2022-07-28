import 'package:flutter/material.dart';
import 'package:mini_feed_project/components/colors.dart';
import 'package:mini_feed_project/views/home_page.dart';
import 'package:mini_feed_project/views/new_post_page.dart';
import 'package:mini_feed_project/views/profile_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MiniFeed",
        home: const MainScreen(),
        theme: ThemeData(colorScheme: nepsColorTheme));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;
  final _widgetOptions = const [HomePage(), NewPostPage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // REMOVED APP BAR
      // appBar: AppBar(
      //   title: const Text('MiniFeed'),
      // ),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [NepsColors.black, NepsColors.blue],
          )),
          child: IndexedStack(
            children: _widgetOptions,
            index: _selectedIndex,
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
