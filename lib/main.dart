import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relógio',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaAtual = 0;

  final List<Widget> _paginas = [
    Pagina1(),
    Pagina2(),
    Pagina3(),
    Pagina4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Relógio')),
      body: _paginas[_paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 0, 179, 255),
        unselectedItemColor: Color.fromARGB(255, 0, 55, 255),
        currentIndex: _paginaAtual,
        onTap: (index) => setState(() => _paginaAtual = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Relógio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Despertador',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_sharp),
            label: 'Cronômetro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_bottom),
            label: 'Temporizador',
          ),
        ],
      ),
    );
  }
}

// -------------------- PÁGINA 1: Relógio --------------------

class Pagina1 extends StatefulWidget {
  @override
  _Pagina1State createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  String _horaAtual = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _atualizarHora();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_) {
        if (!mounted) return;
        _atualizarHora();
      },
    );
  }

  void _atualizarHora() {
    final agora = DateTime.now();
    setState(() {
      _horaAtual =
          '${_formatar(agora.hour)}:${_formatar(agora.minute)}:${_formatar(agora.second)}';
    });
  }

  String _formatar(int n) => n.toString().padLeft(2, '0');

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 100),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            _horaAtual,
            style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// -------------------- PÁGINA 2: Despertador --------------------

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Despertador',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

// -------------------- PÁGINA 3: Cronômetro --------------------

class Pagina3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Despertador',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

// -------------------- PÁGINA 4: Temporizador --------------------

class Pagina4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Despertador',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}