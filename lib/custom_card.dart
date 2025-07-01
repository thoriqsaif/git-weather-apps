import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class MyWeatherCard extends StatelessWidget {
  const MyWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ),
              ],
            ),
          ),
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
  const CustomWeatherCard({
    required this.icon,
    required this.title,
    required this.cuaca,
    required this.celcius,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
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
          ],
        ),
      ),
    );
  }
}
