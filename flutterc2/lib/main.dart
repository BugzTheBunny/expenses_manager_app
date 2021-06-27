import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transtaction> transactions = [
    Transtaction(
        title: 'New Shoes', amount: 45.99, date: DateTime.now(), id: 't1'),
    Transtaction(
        title: 'New Dress', amount: 55.99, date: DateTime.now(), id: 't2'),
    Transtaction(
        title: 'Playstatatation 5',
        amount: 22.99,
        date: DateTime.now(),
        id: 't3'),
    Transtaction(title: 'Fruits', amount: 33.99, date: DateTime.now(), id: 't4')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              child: Text(
                'Chart!',
              ),
            ),
            elevation: 5,
          ),
          Container(
            child: Card(
              elevation: 3,
              child: Container(
                child: Column(
                  children: [
                    TextField(),
                    TextField(),
                  ],
                ),
              ),
            ),
          ),
          Column(
              children: transactions.map((tx) {
            return Card(
              elevation: 3,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepPurple[300],
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 2,
                        )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$ ${tx.amount.toString()} ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        DateFormat().format(tx.date),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black38),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
