import 'package:expensee/constants.dart';
import 'package:expensee/models/transaction.dart';
import 'package:expensee/widgets/chart.dart';
import 'package:expensee/widgets/new_transaction.dart';
import 'package:expensee/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: kprimaryColor,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              button: TextStyle(color: Colors.white),
            ),
        // appBarTheme: AppBarTheme(
        //   textTheme: ThemeData.light().textTheme.copyWith(
        //         headline6: TextStyle(
        //           fontFamily: 'OpenSans',
        //           fontSize: 20,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        // ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _usertransaction = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _usertransaction.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      _usertransaction.add(newTx);
    });
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _usertransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: klighterGreyColor,

        // appBar: AppBar(
        //   title: Text('Personal Expenses'),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.add),
        //       onPressed: () => _startAddTransaction(context),
        //     ),
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(color: kDarkColor, fontSize: 18),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Johnie',
                          style: TextStyle(
                              color: kDarkColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.history),
                      onPressed: null,
                      color: kDarkerGreyColor,
                      iconSize: 35,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Expenses on',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kDarkerGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Feb 12',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Chart(_recentTransactions),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: kDarkerGreyColor,
                          ),
                        ),
                        Text(
                          'Balance',
                          style: TextStyle(color: Colors.blueGrey),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: kprimaryColor,
                          ),
                        ),
                        Text(
                          'Spending',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(
                            'Expenses',
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 3,
                          color: kDarkerGreyColor,
                          height: 10,
                        ),
                      ),
                      TransactionList(_usertransaction, _deleteTransaction),
                    ],
                  )),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddTransaction(context),
        ),
      ),
    );
  }
}
