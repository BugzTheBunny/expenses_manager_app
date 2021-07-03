import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No Transactions added'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    'assets/images/zzz.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  elevation: 7,
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        )),
                    title: Text(
                      '${transactions[index].title}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
