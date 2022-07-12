import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  bool hasInternet = false;

  @override
  void initState() {
    super.initState();

    InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
        inter();
      });
    });
  }

  inter() {
    if (hasInternet == false) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                content: const Text(
                  'No Internet',
                  style: TextStyle(fontFamily: 'Quicksand'),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text(
                  'Has Internet',
                  style: TextStyle(fontFamily: 'Quicksand'),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IndexedStack(
              index: _index,
              children: const <Widget>[
                Text('1'),
                Text('2'),
                Text('3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = 0;
                      print(_index);
                    });
                  },
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = 1;
                      print(_index);
                    });
                  },
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = 2;
                      print(_index);
                    });
                  },
                  child: const Text('2'),
                )
              ],
            ),
            RichText(
                text: const TextSpan(
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                    children: [
                  TextSpan(
                      text: '1',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  TextSpan(
                      text: '2',
                      style: TextStyle(
                        color: Colors.red,
                      )),
                  TextSpan(
                      text: '3',
                      style: TextStyle(
                        color: Colors.blue,
                      )),
                ]))
          ],
        ),
      ),
    );
  }
}
