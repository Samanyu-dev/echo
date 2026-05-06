import 'package:flutter/foundation.dart';

@immutable
class Expense {
  final String id;
  final String eventId;
  final String title;
  final double amount;
  final String paidById;
  final List<String> splitBetweenIds;
  final DateTime createdAt;

  const Expense({
    required this.id,
    required this.eventId,
    required this.title,
    required this.amount,
    required this.paidById,
    required this.splitBetweenIds,
    required this.createdAt,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      eventId: json['event_id'],
      title: json['title'],
      amount: (json['amount'] as num).toDouble(),
      paidById: json['paid_by_id'],
      splitBetweenIds: List<String>.from(json['split_between_ids'] ?? []),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_id': eventId,
      'title': title,
      'amount': amount,
      'paid_by_id': paidById,
      'split_between_ids': splitBetweenIds,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
