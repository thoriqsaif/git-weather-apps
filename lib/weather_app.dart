import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_packages/detail_screen.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    Widget bodyContent;
    if (_selectedIndex == 0) {
      bodyContent = Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/cuaca_images.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Perkiraan Cuaca Hari ini',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 600) {
                        return MobileLayout(textScaler: textScaler);
                      } else if (constraints.maxWidth < 1200) {
                        return TabletLayout(textScaler: textScaler);
                      } else {
                        return DesktopLayout(textScaler: textScaler);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else if (_selectedIndex == 1) {
      bodyContent = Center(child: Text('Search Screen'));
    } else if (_selectedIndex == 2) {
      bodyContent = Center(child: Text('Profile Screen'));
    } else {
      bodyContent = Container();
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 208, 231, 250),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 162, 213, 255),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
      body: bodyContent,
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
    );
  }
}

class CustomWeatherCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String cuaca;
  final dynamic celcius;
  final Color color;
  final VoidCallback onPressed;
  // final VoidCallback? onTap;

  const CustomWeatherCard({
    required this.icon,
    required this.title,
    required this.cuaca,
    required this.celcius,
    required this.color,
    required this.onPressed,
    // this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 120,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: icon,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                cuaca,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '$celcius°C',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 58, 112, 183),
                ),
                onPressed: onPressed,
                child: Text('Detail', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
    // if (onTap != null) {
    //   onTap!();
    // }
  }
}

// class MyWeatherApp extends StatefulWidget {
//   @override
//   _MyWeatherAppState createState() => _MyWeatherAppState();
// }

// class _MyWeatherAppState extends State<MyWeatherApp> {
//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.deepPurple,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

class MobileLayout extends StatelessWidget {
  final TextScaler textScaler;

  const MobileLayout({required this.textScaler, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        SizedBox(height: 10),
        CustomWeatherCard(
          title: 'Jakarta',
          cuaca: 'Cerah',
          celcius: 30,
          icon: Icon(
            WeatherIcons.day_sunny,
            color: const Color.fromARGB(255, 238, 143, 1),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: 'Jakarta, Cerah, 30°C'),
              ),
            );
          },
        ),
        CustomWeatherCard(
          title: 'Bandung',
          cuaca: 'Hujan Badai',
          celcius: 17,
          icon: Icon(
            WeatherIcons.rain_wind,
            color: const Color.fromARGB(255, 38, 222, 255),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: 'Bandung, Hujan Badai, 17°C'),
              ),
            );
          },
        ),
      ],
    );
  }
}

class TabletLayout extends StatelessWidget {
  final TextScaler textScaler;

  const TabletLayout({required this.textScaler, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16),
      children: [
        CustomWeatherCard(
          title: 'Yogyakarta',
          cuaca: 'Mendung',
          celcius: 27,
          icon: Icon(
            WeatherIcons.cloudy_windy,
            color: const Color.fromARGB(255, 127, 200, 248),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: 'Yogyakarta, Mendung, 27°C'),
              ),
            );
          },
        ),
        CustomWeatherCard(
          title: 'Surabaya',
          cuaca: 'Badai Petir',
          celcius: 24,
          icon: Icon(
            WeatherIcons.rain_wind,
            color: const Color.fromARGB(255, 250, 13, 84),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: 'Surabaya, Badai Petir, 24°C'),
              ),
            );
          },
        ),
      ],
    );
  }
}

class DesktopLayout extends StatelessWidget {
  final TextScaler textScaler;

  const DesktopLayout({required this.textScaler, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(16),
      children: [
        CustomWeatherCard(
          title: 'Jakarta',
          cuaca: 'Cerah',
          celcius: 30,
          icon: Icon(
            WeatherIcons.day_sunny,
            color: const Color.fromARGB(255, 238, 143, 1),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: 'Jakarta, Cerah, 30°C'),
              ),
            );
          },
        ),
        CustomWeatherCard(
          title: 'Bandung',
          cuaca: 'Hujan Badai',
          celcius: 17,
          icon: Icon(
            WeatherIcons.rain_wind,
            color: const Color.fromARGB(255, 38, 222, 255),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: 'Bandung, Hujan Badai, 17°C'),
              ),
            );
          },
        ),
        CustomWeatherCard(
          title: 'Yogyakarta',
          cuaca: 'Mendung',
          celcius: 27,
          icon: Icon(
            WeatherIcons.cloudy_windy,
            color: const Color.fromARGB(255, 127, 200, 248),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: 'Yogyakarta, Mendung, 27°C'),
              ),
            );
          },
        ),
        CustomWeatherCard(
          title: 'Surabaya',
          cuaca: 'Badai Petir',
          celcius: 24,
          icon: Icon(
            WeatherIcons.rain_wind,
            color: const Color.fromARGB(255, 250, 13, 84),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: 'Surabaya, Badai Petir, 24°C'),
              ),
            );
          },
        ),
      ],
    );
  }
}
