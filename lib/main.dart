import 'package:audioplayers/audioplayers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WoodenFish',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool flag=true;
  GetStorage box = GetStorage();
  final _style = const TextStyle(fontFamily: 'Pacifico',fontSize: 60);
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() {
    setState(() {
      _counter = box.read('counter')??0;
    });
  }

  void _incrementCounter() {
    setState(() {_counter++;});
    box.write('counter', _counter);
  }

  void settingsOnPressed(){

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _incrementCounter();
        flag=!flag;
        final player =AudioPlayer();
        player.play(AssetSource('waw/da.wav'));
      },
      child: Scaffold(
        appBar:AppBar(title:Text('WoodenFish',style: _style,)),
        floatingActionButton: IconButton(
            onPressed: settingsOnPressed,
            icon: const Icon(Icons.settings,size: 35,)
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_counter',style: _style,),
              Text('功德',style: _style,),
              Image(
                image: const AssetImage('assets/img/wooden fish.png'),
                width: flag?311:301,
                height: flag?263:253,
              ),
            ],
          ),
        ),
      ), 
    );
  }
}
