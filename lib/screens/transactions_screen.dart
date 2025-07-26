import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: _getTransactionTypeColor(_getTransactionType(index)),
                child: Icon(
                  _getTransactionTypeIcon(_getTransactionType(index)),
                  color: Colors.white,
                ),
              ),
              title: Text(
                _getTransactionTitle(index),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'رقم المعاملة: #${2000 + index}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'التاريخ: ${_getTransactionDate(index)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'المبلغ: ',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '${_getTransactionAmount(index)} ريال',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _getTransactionTypeColor(_getTransactionType(index)),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getTransactionStatusColor(_getTransactionStatus(index)).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getTransactionStatus(index),
                      style: TextStyle(
                        color: _getTransactionStatusColor(_getTransactionStatus(index)),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  // Navigate to transaction details
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('عرض تفاصيل المعاملة #${2000 + index}'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  String _getTransactionType(int index) {
    final types = ['دفع', 'استرداد', 'خصم', 'إيداع', 'تحويل'];
    return types[index % types.length];
  }

  String _getTransactionTitle(int index) {
    final titles = [
      'دفع طلب #1001',
      'استرداد مبلغ',
      'خصم رسوم الشحن',
      'إيداع رصيد',
      'تحويل إلى حساب آخر',
      'دفع طلب #1002',
      'استرداد جزئي',
      'خصم ضريبي',
      'إيداع هدية',
      'تحويل من حساب آخر',
      'دفع طلب #1003',
      'استرداد كامل',
      'خصم رسوم الخدمة',
      'إيداع مكافأة',
      'تحويل داخلي',
    ];
    return titles[index % titles.length];
  }

  Color _getTransactionTypeColor(String type) {
    switch (type) {
      case 'دفع':
        return Colors.red;
      case 'استرداد':
        return Colors.green;
      case 'خصم':
        return Colors.orange;
      case 'إيداع':
        return Colors.blue;
      case 'تحويل':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData _getTransactionTypeIcon(String type) {
    switch (type) {
      case 'دفع':
        return Icons.payment;
      case 'استرداد':
        return Icons.money_off;
      case 'خصم':
        return Icons.remove_circle;
      case 'إيداع':
        return Icons.account_balance_wallet;
      case 'تحويل':
        return Icons.swap_horiz;
      default:
        return Icons.attach_money;
    }
  }

  String _getTransactionStatus(int index) {
    final statuses = ['مكتمل', 'قيد المعالجة', 'معلق', 'فشل'];
    return statuses[index % statuses.length];
  }

  Color _getTransactionStatusColor(String status) {
    switch (status) {
      case 'مكتمل':
        return Colors.green;
      case 'قيد المعالجة':
        return Colors.blue;
      case 'معلق':
        return Colors.orange;
      case 'فشل':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getTransactionDate(int index) {
    final now = DateTime.now();
    final transactionDate = now.subtract(Duration(days: index * 2));
    return '${transactionDate.day}/${transactionDate.month}/${transactionDate.year}';
  }

  String _getTransactionAmount(int index) {
    final amounts = [150, -89, -25, 500, 200, 300, -45, -15, 100, 150, 250, -75, -10, 200, 300];
    return amounts[index % amounts.length].toString();
  }
} 