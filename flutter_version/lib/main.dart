import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:flutter_version/DetailScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext contect) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
      ),
      body: _buildSuggestions(),

    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
//        itemCount: 10,
        itemBuilder:  (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: () {
//        log('aaaaa');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(),
          ),
        );
      }
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

//https://flutter.dev/docs/get-started/codelab