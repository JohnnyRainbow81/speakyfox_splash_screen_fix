// ignore_for_file: public_member_api_docs, sort_constructors_first
class Invoice {
  String periodStart;
  String periodEnd;
  int total;
  String status;
  bool paid;
  String? dueDate;
  String? currency;
  dynamic paymentMethod;
  
  Invoice({
    required this.periodStart,
    required this.periodEnd,
    required this.total,
    required this.status,
    required this.paid,
    required this.dueDate,
    required this.currency,
    required this.paymentMethod,
  });

  @override
  String toString() {
    return 'Invoice(periodStart: $periodStart, periodEnd: $periodEnd, total: $total, status: $status, paid: $paid, dueDate: $dueDate, currency: $currency, paymentMethod: $paymentMethod)';
  }
}
