import 'package:basic_app/core/util/constants/colors.dart';
import 'package:basic_app/features/presentation/controllers/example_controller.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _examController = ExampleController();

  int _selectedIndex = 0;
  final _widgetOptions = [
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Trợ giúp',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Tìm kiếm',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Tài khoản',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColor.kPrimary,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.approval),
            label: 'Phê duyệt',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center),
            label: 'Trợ giúp',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
