import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quote Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<Quote> quotes = [
    Quote(text: 'Coding like poetry should be short and concise.', author: 'Santosh Kalwar'),
    Quote(text: 'First, solve the problem. Then, write the code.', author: 'John Johnson'),
    Quote(text: 'Make it work, make it right, make it fast.', author: 'Kent Beck'),
  ];

  void deleteQuote(Quote quote) {
    setState(() {
      quotes.remove(quote);
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          onDelete: () => deleteQuote(quote),
        )).toList(),
      ),
    );
  }
}


