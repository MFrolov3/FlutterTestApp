import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class ContentChange extends ChangeNotifier {
  String _content = "";
  String get content => _content;

  void changeContent (String str){
    _content = str;
    notifyListeners();
  }
}


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContentChange()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Test task flutter'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => ContentChange(),
          child: const Column(
            children: [
              Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                      child: Buttons())),
              Counter(),
            ],
          ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Text(
          context.watch<ContentChange>().content,
          style: const TextStyle(
            fontSize: 20
          )
      ),
    )));
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo, width: 5),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: MediaQuery.of(context).size.height*.1,
        width: MediaQuery.of(context).size.width*.8,
        child: ElevatedButton(
            onPressed: () {
              context.read<ContentChange>().changeContent("An airplane (American English), or aeroplane (Commonwealth English), informally plane, is a fixed-wing aircraft that is propelled forward by thrust from a jet engine, propeller, or rocket engine. Airplanes come in a variety of sizes, shapes, and wing configurations. The broad spectrum of uses for airplanes includes recreation, transportation of goods and people, military, and research. Worldwide, commercial aviation transports more than four billion passengers annually on airliners[1] and transports more than 200 billion tonne-kilometers[2] of cargo annually, which is less than 1% of the world's cargo movement.[3] Most airplanes are flown by a pilot on board the aircraft, but some are designed to be remotely or computer-controlled such as drones.");
            },
            child: const Icon(Icons.airplanemode_active_rounded, size: 60))),
        const SizedBox(width: 200, height: 10),
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo, width: 5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: MediaQuery.of(context).size.height*.1,
            width: MediaQuery.of(context).size.width*.8,
            child: ElevatedButton(
                onPressed: () {
                  context.read<ContentChange>().changeContent("A bus (contracted from omnibus,[1] with variants multi-bus, motor-bus, auto bus, etc.) is a road vehicle that carries significantly more passengers than an average car or van. It is most commonly used in public transport, but is also in use for charter purposes, or through private ownership. Although the average bus carries between 30 and 100 passengers, some buses have a capacity of up to 300 passengers.[2] The most common type is the single-deck rigid bus, with double-decker and articulated buses carrying larger loads, and buses and minibuses carrying smaller loads. Coaches are used for longer-distance services. Many types of buses, such as city transit buses and inter-city coaches, charge a fare. Other types, such as elementary or secondary school buses or shuttle buses within a post-secondary education campus, are free. In many jurisdictions, bus drivers require a special large vehicle licence above and beyond a regular driving licence.");
                },
                child: const Icon(Icons.airport_shuttle, size: 60))),

        const SizedBox(width: 200, height: 10),
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo, width: 5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: MediaQuery.of(context).size.height*.1,
            width: MediaQuery.of(context).size.width*.8,
            child: ElevatedButton(
                onPressed: () {
                  context.read<ContentChange>().changeContent("An apartment (American English), flat (British English, Indian English, South African English), or unit (Australian English), is a self-contained housing unit (a type of residential real estate) that occupies part of a building, generally on a single storey. There are many names for these overall buildings, see below.");
                },
                child: const Icon(Icons.apartment_outlined, size: 60))),
      ],
    );
  }
}