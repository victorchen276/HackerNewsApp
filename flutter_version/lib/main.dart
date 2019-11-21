import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:flutter_version/DetailScreen.dart';
import 'package:progress_hud/progress_hud.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//        title: 'Startup Name Generator',
        home: HackerNews(),
    );
  }
}

class HackerNewsState extends State<HackerNews> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  ProgressHUD _progressHUD;
  bool _loading = true;

  @override
  void initState() {
    _progressHUD = new ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0,
      loading: false,
      text: 'Loading...',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext contect) {
    void dismissProgressHUD() {
      setState(() {
        if (_loading) {
          _progressHUD.state.dismiss();
        } else {
          _progressHUD.state.show();
        }

        _loading = !_loading;
      });
    }

//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Hacker News'),
//      ),
//      body: _buildSuggestions(),
//
//    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('ProgressHUD Demo'),
        ),
        body: new Stack(
          children: <Widget>[
            new Text(
                'A clean and lightweight progress HUD for your Flutter app'),
            _progressHUD,
//            new Positioned(
//                child: new FlatButton(
//                    onPressed: dismissProgressHUD,
//                    child: new Text(_loading ? "Dismiss" : "Show")),
//                bottom: 30.0,
//                right: 10.0)
          ],
        )
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


class HackerNews extends StatefulWidget {
  @override
  HackerNewsState createState() => HackerNewsState();
}
