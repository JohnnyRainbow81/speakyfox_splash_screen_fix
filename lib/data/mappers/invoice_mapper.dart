import 'package:speakyfox/data/responses/invoice_response.dart';
import 'package:speakyfox/domain/models/invoice.dart';

extension InvoiceMapper on InvoiceResponse {
  Invoice toInvoice() {
    return Invoice(
        periodStart: periodStart,
        periodEnd: periodEnd,
        total: total,
        status: status,
        paid: paid,
        dueDate: dueDate,
        currency: currency,
        paymentMethod: paymentMethod);
  }
}
