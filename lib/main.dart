
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));

}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _myAppState();

}
class _myAppState extends State<MyApp> {

    int _counter=0;
    static bool _reversed= false;

    @override
    Widget build(BuildContext context) {


      final  incrementButton = FlatButton(
          color: Colors.tealAccent,
          child: Text("Increment", style: TextStyle(color: Colors.white) ),
          onPressed: _increment
      );


      final decrementButton = FlatButton(
          color: Colors.tealAccent,
          child: Text("Decrement", style: TextStyle(color: Colors.white) ),
          onPressed: _decrement);

      List<Widget> _widgets = [ incrementButton, decrementButton];

      if (_reversed) {
        _widgets =_widgets.reversed.toList();
      }

      return MaterialApp(
          debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Container(
                     margin: EdgeInsets.only(bottom: 100.0),
                     padding : EdgeInsets.all(10.0),
                     child: Image.asset("Unknown.png",
                         width: 100.0, height: 100.0),
                     decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4.0)
                     ),
                   ),
                   Text('$_counter',
                        style: TextStyle(color: Colors.black)),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: _widgets
                   )
                 ]
             )
            ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.replay),
            onPressed: _setToZero,
          ),
        )
      );
    }


    void _decrement() {
      setState(() {
        _counter--;
      });
    }

    void _increment() {
      setState(() {
        _counter++;
      });
    }

    void _setToZero() {
        setState(() {
          _counter=0;
          _swap();
        });
    }

    void _swap() {
      setState(() {
        _reversed= !_reversed;
      });
    }

}




