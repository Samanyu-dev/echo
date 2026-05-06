import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../domain/expense.dart';

class ExpenseScreen extends StatelessWidget {
  final String eventId;
  const ExpenseScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text('Event Expenses'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          
          // Summary Card
          _ExpenseSummaryCard().animate().fadeIn().scale(begin: const Offset(0.95, 0.95)),
          
          const SizedBox(height: 32),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Settle Up'),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _ExpenseTile(index: index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddExpense(context),
        backgroundColor: AppColors.accent,
        icon: const Icon(Icons.add),
        label: const Text('Add Expense'),
      ).animate().fadeIn(delay: 500.ms).moveY(begin: 20, end: 0),
    );
  }

  void _showAddExpense(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _AddExpenseSheet(),
    );
  }
}

class _ExpenseSummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: AppColors.highlightGradient,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Total Spend',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            '\$1,240.50',
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _SummaryDetail(label: 'You Paid', value: '\$450.00'),
              Container(width: 1, height: 30, color: Colors.white24),
              _SummaryDetail(label: 'You Owe', value: '\$120.00'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryDetail extends StatelessWidget {
  final String label;
  final String value;
  const _SummaryDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}

class _ExpenseTile extends StatelessWidget {
  final int index;
  const _ExpenseTile({required this.index});

  @override
  Widget build(BuildContext context) {
    final titles = ["Drinks & Snacks", "Villa Booking", "Sound System", "Decorations"];
    final amounts = ["\$85.00", "\$850.00", "\$200.00", "\$105.50"];
    final dates = ["Today, 2:30 PM", "Yesterday", "2 days ago", "3 days ago"];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.receipt_long_outlined, color: AppColors.accent, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titles[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(dates[index], style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Text(
            amounts[index],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 100).ms).moveX(begin: 20, end: 0);
  }
}

class _AddExpenseSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 24,
        left: 24,
        right: 24,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text('New Expense', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 24),
          const TextField(
            decoration: InputDecoration(hintText: 'What was it for?'),
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0.00',
              prefixText: '\$ ',
            ),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => context.pop(),
            child: const Text('Save Expense'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
