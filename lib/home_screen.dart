import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Text("Ini adalah halaman home screen"),
//             //push with route
//             // ElevatedButton(
//             //   onPressed: () => Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //       builder: (context) =>
//             //           DetailScreen(message: "Hello from home screen"),
//             //     ),
//             //   ),
//             //   child: Text('Move to Detail'),
//             // ),
//             //push with named
//             ElevatedButton(
//               onPressed: () => Navigator.pushNamed(
//                 context,
//                 '/detail',
//                 arguments: 'Halo, ini data yang dikirimkan 123',
//               ),
//               child: Text('Move to Detail'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToDetail() {
    Navigator.pushNamed(context, '/detail', arguments: 'Hello from Home!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer + Bottom Nav')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Navigation Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Go to Detail'),
              onTap: () {
                Navigator.pop(context); // close drawer
                _navigateToDetail();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // close drawer
                // Add logout logic here
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToDetail,
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
