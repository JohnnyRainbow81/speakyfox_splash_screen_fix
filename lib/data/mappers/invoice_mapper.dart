import 'package:speakyfox/data/dtos/invoice_dto.dart';
import 'package:speakyfox/domain/models/invoice.dart';

extension InvoiceMapper on InvoiceDto {
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
