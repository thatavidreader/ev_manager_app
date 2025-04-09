import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double _balance = 250.0; // Default wallet balance

  final TextEditingController _amountController = TextEditingController();

  void _addMoney() {
    final amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0) {
      setState(() {
        _balance += amount;
      });
      _amountController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('₹$amount added to your wallet!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Current Balance',
                style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 10),
            Text('₹${_balance.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 40,
                    color: const Color.fromARGB(255, 71, 204, 179))),
            SizedBox(height: 30),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add Money'),
              onPressed: _addMoney,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 25, 131, 127)),
            ),
          ],
        ),
      ),
    );
  }
}
