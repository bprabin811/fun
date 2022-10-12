import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var list = ['defeat','cooperate'];
  var user='...';
  var computer='...';

  var usertotal=0;
  var computertotal=0;
    

// generates a new Random object
final randomNum = Random();

// generate a random index based on the list length
// and use it to retrieve the element
  
  var cump=0;
  var you=0;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade100,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('P L A Y',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.amber.shade800
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('C O M P U T E R :',
                style: TextStyle(
                  fontSize: 25
                ),),
                const Gap(20),
                Text('$computer (+$cump)',
                style:  TextStyle(
                  fontSize: 20,
                  color: Colors.pink.shade800                 
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Y O U :',
                style: TextStyle(
                  fontSize: 25
                ),),
                const Gap(20),
                Text('$user (+$you)',
                style:  TextStyle(
                  fontSize: 20,
                  color: Colors.pink.shade800                 
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('C H O O S E :'),
                const Gap(10),
                MaterialButton(
                color: Colors.red.shade500,
                onPressed: scored,
                child: const Text('Defeat'),),
                const Gap(10),
                MaterialButton(
                color: Colors.green.shade500,
                onPressed: scorec,
                child: const Text('Co-operate'),),
              ],
            ),
            Card(
              color: Colors.teal.shade100,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical:25),
                child: Column(
                  children: [
                    Text('Computer Score=$computertotal',
            style: const TextStyle(
                fontSize: 20
            ),),
            Text('Your Score=$usertotal',
            style: const TextStyle(
                fontSize: 20
            ),),
                  ],
                ),
              ),
            ),
            MaterialButton(
                color: Colors.amber.shade500,
                onPressed: (){
                  setState(() {
                    usertotal=0;
                    computertotal=0;
                    you=0;
                    cump=0;
                    user='...';
                    computer='...';
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.restart_alt,size: 30,),
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('R U L E S :',style:  TextStyle(
                fontSize: 20,
                color: Colors.white,
                ),),
                Gap(5),
                  Text('1. If both choose defeat then both get 1 point.\n2. If both choose co-operate then both get 3 point.\n3. If one choose co-operate and other choose defeat then defeat will get 5 point and co-operate will get 0 point.'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void scored() {
    var element = list[randomNum.nextInt(list.length)];
    var r ='defeat';
    setState(() {
      if(element=='cooperate' && prabin=='defeat')
      {
        computer=element;
        user =r;
        cump=5;
        you=0;
        usertotal+=0;
        computertotal+=5;
      }else if(element=='defeat' && prabin=='defeat'){
        computer=element;
        user =r;
        cump=1;
        you=1;
        usertotal+=1;
        computertotal+=1;
      }
    });
  }
  void scorec() {
    var element = list[randomNum.nextInt(list.length)];
    var r='cooperate';
    setState(() {
      if(element=='cooperate' && prabin=='cooperate')
      {
        computer=element;
        user =r;
        cump=3;
        you=3;
        usertotal+=3;
        computertotal+=3;
      }else if(element=='defeat' && prabin=='cooperate'){
        computer=element;
        user =r;
        cump=0;
        you=5;
        usertotal+=5;
        computertotal+=0;
      }
    });
  }
}
