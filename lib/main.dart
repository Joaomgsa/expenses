import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  final _transactions =[
      Transaction(
        id: 't1', title: "Tenis de Corrida", value: 310.79, date: DateTime.now()),
        Transaction(
        id: 't2', title: "Conta de luz", value: 210.30, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold
    ( appBar: AppBar(
      title: const Text('Despesas Pessoais'),
    ),body:  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      const SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 5,
          color: Colors.blue,
          child: Text('Grafico'))
      ),
      Column(
        children: _transactions.map((tr){
            return Card(
              child: Row(children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple.shade500,
                      width: 2,) ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${tr.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Text(tr.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),),
                    Text(
                      DateFormat('d MMM y').format(tr.date)
                      ,style: const TextStyle(
                      color: Colors.grey
                    ),)
                  ],
                )
              ]),
            );
        }).toList(),
      ),
      const Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Título'
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)'
                ),
              ),
              TextButton(
                onPressed: minhaFuncao,
                child: Text("Nova Transação"),
               )
            ],
          ),
        ),
      )
      ],
      ),
    );
  }
}

void minhaFuncao() {
  print('botao pressionado');
}