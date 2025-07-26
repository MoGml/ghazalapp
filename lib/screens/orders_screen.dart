import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: _getStatusColor(_getOrderStatus(index)),
                child: Icon(
                  _getStatusIcon(_getOrderStatus(index)),
                  color: Colors.white,
                ),
              ),
              title: Text(
                'طلب رقم #${1000 + index}',
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
                    'تاريخ الطلب: ${_getOrderDate(index)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'المبلغ: ${_getOrderAmount(index)} ريال',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(_getOrderStatus(index)).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getOrderStatus(index),
                      style: TextStyle(
                        color: _getStatusColor(_getOrderStatus(index)),
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
                  // Navigate to order details
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('عرض تفاصيل الطلب #${1000 + index}'),
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

  String _getOrderStatus(int index) {
    final statuses = ['معلق', 'قيد المعالجة', 'تم الشحن', 'تم التسليم', 'ملغي'];
    return statuses[index % statuses.length];
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'معلق':
        return Colors.orange;
      case 'قيد المعالجة':
        return Colors.blue;
      case 'تم الشحن':
        return Colors.purple;
      case 'تم التسليم':
        return Colors.green;
      case 'ملغي':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'معلق':
        return Icons.pending;
      case 'قيد المعالجة':
        return Icons.sync;
      case 'تم الشحن':
        return Icons.local_shipping;
      case 'تم التسليم':
        return Icons.check_circle;
      case 'ملغي':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  String _getOrderDate(int index) {
    final now = DateTime.now();
    final orderDate = now.subtract(Duration(days: index * 3));
    return '${orderDate.day}/${orderDate.month}/${orderDate.year}';
  }

  String _getOrderAmount(int index) {
    final amounts = [150, 89, 234, 567, 123, 789, 456, 321, 654, 987];
    return amounts[index % amounts.length].toString();
  }
} 