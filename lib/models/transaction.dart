class Transaction {
  // Just a class with normal dart language, will be used in the main app.
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {required this.title,
      required this.amount,
      required this.date,
      required this.id});
}
