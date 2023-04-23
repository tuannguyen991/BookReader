import 'package:demo_book_reader/models/payment/create_order_response.dart';

abstract class PaymentRepository {
  Future<CreateOrderResponse?> createOrder(int price);
}
