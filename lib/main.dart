import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _currentSliderValue = 0;
   int _counter = 0;
   void _increament(){
     setState(() {
       _counter++;
     });
   }
   void _decreament(){
     setState(() {
       _counter--;
     });
   }
    var activeCardColor = Colors.amber;
  var inActiveCardColor = Color(0xFF272B4E);

  var maleCardColor = Color(0xFF272B4E);

  var femaleCardColor = Color(0xFF272B4E);

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inActiveCardColor;
      } else if (maleCardColor == activeCardColor) {
        maleCardColor = inActiveCardColor;
      }
    }
  }

  void updateColor2(int gender) {
    if (gender == 2) {
      if (femaleCardColor == inActiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      } else if (femaleCardColor == activeCardColor)
        femaleCardColor = inActiveCardColor;
    }
  }

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: 
    AppBar(
      title: Text('Exam Test'),
      centerTitle: true,
      ),
      body: Column(children: [
        Expanded(child: Row(children: [
         
          Expanded(child: Card(
            color: Colors.teal,
            child: Column(children: [
              Text('$_counter',style: TextStyle(fontSize: 66),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                
                FloatingActionButton(onPressed: _increament, child: Icon(Icons.add), ),
                 FloatingActionButton(onPressed: _decreament, child: Icon(Icons.remove), )
              ],
              ),
            ],
            ),
          ),
          ),
        
        ],
        ),
        
        ),
        Expanded(child: Card(
          color: Colors.pink,
          child: Row(children: [
            Expanded(child: Column(children: [
              Text(_currentSliderValue.round().toString(),style: TextStyle(fontSize: 89),),
              
        
              Slider(
              value: _currentSliderValue,
              max: 200,
              activeColor: Colors.red,
             inactiveColor: Colors.white,
        
              
              onChanged: ( double value) {
          setState(() {
            _currentSliderValue = value;
          });
              },
            )
            ],)),
            
          ],
          ),
        ),
        
        ),
        Expanded(child: Row(children: [
          Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: Container(
                        color: maleCardColor,
                        
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: Container(
                        color: femaleCardColor,
                        
                      ),
                    ),
                  ),
         
        ],
        ),
        
        ),
      ],),
      ),
      );
  }
}