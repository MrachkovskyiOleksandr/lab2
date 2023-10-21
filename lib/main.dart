import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Переглядач картинок')),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ThemeButton(
                theme: 'Троянди',
                images: const [
                  'https://images.pexels.com/photos/2300713/pexels-photo-2300713.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/133472/pexels-photo-133472.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/62332/pexels-photo-62332.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/7947304/pexels-photo-7947304.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/1713948/pexels-photo-1713948.jpeg?auto=compress&cs=tinysrgb&w=1600',
                ],
                imageHeight: 500,
              ),
              ThemeButton(
                theme: 'Нічні міста',
                images: const [
                  'https://images.pexels.com/photos/2129796/pexels-photo-2129796.png?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/2603464/pexels-photo-2603464.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/2411688/pexels-photo-2411688.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/3125171/pexels-photo-3125171.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/2793175/pexels-photo-2793175.jpeg?auto=compress&cs=tinysrgb&w=1600',
                ],
                imageHeight: 500,
              ),
              ThemeButton(
                theme: 'Літаки',
                images: const [
                  'https://images.pexels.com/photos/1687633/pexels-photo-1687633.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/1928067/pexels-photo-1928067.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/112116/pexels-photo-112116.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/2805672/pexels-photo-2805672.jpeg?auto=compress&cs=tinysrgb&w=1600',
                  'https://images.pexels.com/photos/4004016/pexels-photo-4004016.jpeg?auto=compress&cs=tinysrgb&w=1600',
                ],
                imageHeight: 500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ThemeButton extends StatelessWidget {
  final String theme;
  final List<String> images;
  final double imageHeight;

  ThemeButton(
      {required this.theme, required this.images, required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Image.network(
            images[0],
            height: imageHeight,
            fit: BoxFit.cover,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThemeScreen(
                  theme: theme,
                  images: images,
                  imageHeight: imageHeight,
                ),
              ),
            );
          },
          child: Text(theme),
        ),
      ],
    );
  }
}

class ThemeScreen extends StatefulWidget {
  final String theme;
  final List<String> images;
  final double imageHeight;

  ThemeScreen(
      {required this.theme, required this.images, required this.imageHeight});

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int _currentIndex = 0;

  void _nextImage() {
    if (_currentIndex < widget.images.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  void _previousImage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    } else {
      setState(() {
        _currentIndex = widget.images.length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.theme)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.network(
              widget.images[_currentIndex],
              height: widget.imageHeight,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: _previousImage,
                    child: const Text('Попереднє'),
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextImage,
                  child: const Text('Наступне'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
