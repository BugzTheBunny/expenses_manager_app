import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutterc2/widgets/add_transaction.dart';
import 'package:flutterc2/widgets/chart.dart';
import 'package:flutterc2/widgets/transactions_list.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Expenses',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amberAccent,
            fontFamily: 'AkayaKanadaka'),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];
  bool _showChart = false;
  List<Transaction> get _recentTransactions {
    return [
      ..._userTransactions.where((tx) {
        return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      }).toList()
    ];
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              child: NewTransaction(_addNewTransaction),
              onTap: () {},
              behavior: HitTestBehavior.opaque);
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context);
    final _isLandscape = mediaQ.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text('My Expenses'),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add))
      ],
    );

    final _txListWidget = Container(
        height: (mediaQ.size.height -
                appBar.preferredSize.height -
                mediaQ.padding.top) *
            0.7,
        child: TransactionList(_userTransactions, _deleteTransaction));

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                      value: _showChart,
                      onChanged: (value) {
                        setState(() {
                          _showChart = value;
                        });
                      }),
                ],
              ),
            if (!_isLandscape)
              Container(
                  height: (mediaQ.size.height -
                          appBar.preferredSize.height -
                          mediaQ.padding.top) *
                      0.3,
                  child: Chart(_recentTransactions)),
            if (!_isLandscape) _txListWidget,
            if (_isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQ.size.height -
                              appBar.preferredSize.height -
                              mediaQ.padding.top) *
                          0.65,
                      child: Chart(_recentTransactions))
                  : _txListWidget
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
              elevation: 5,
              backgroundColor: Theme.of(context).accentColor,
            ),
    );
  }
}
