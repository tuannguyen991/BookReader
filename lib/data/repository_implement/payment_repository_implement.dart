import 'package:demo_book_reader/data/remote/zalopay_config.dart';
import 'package:demo_book_reader/data/repository/payment_repository.dart';
import 'package:demo_book_reader/models/payment/create_order_response.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class PaymentRepositoryImplement implements PaymentRepository {
  @override
  Future<CreateOrderResponse?> createOrder(int price) async {
    var header = new Map<String, String>();
    header['Content-Type'] = 'application/x-www-form-urlencoded';

    var body = new Map<String, String>();
    body['app_id'] = ZaloPayConfig.appId;
    body['app_user'] = ZaloPayConfig.appUser;
    body['app_time'] = DateTime.now().millisecondsSinceEpoch.toString();
    body['amount'] = price.toStringAsFixed(0);
    body['app_trans_id'] = getAppTransId();
    body['embed_data'] = '{}';
    body['item'] = '[]';
    body['bank_code'] = getBankCode();
    body['description'] = getDescription(body['app_trans_id']!);

    var dataGetMac = sprintf('%s|%s|%s|%s|%s|%s|%s', [
      body['app_id'],
      body['app_trans_id'],
      body['app_user'],
      body['amount'],
      body['app_time'],
      body['embed_data'],
      body['item']
    ]);
    body['mac'] = getMacCreateOrder(dataGetMac);
    print("mac: ${body["mac"]}");

    http.Response response = await http.post(
      Uri.https('sb-openapi.zalopay.vn', 'v2/create'),
      headers: header,
      body: body,
    );

    print('body_request: $body');
    if (response.statusCode != 200) {
      return null;
    }

    var data = jsonDecode(response.body);
    print('data_response: $data}');

    return CreateOrderResponse.fromJson(data);
  }
}

String formatNumber(double value) {
  final f = NumberFormat('#,###', 'vi_VN');
  return f.format(value);
}

String formatDateTime(DateTime dateTime, String layout) {
  return DateFormat(layout).format(dateTime).toString();
}

int transIdDefault = 1;
String getAppTransId() {
  if (transIdDefault >= 100000) {
    transIdDefault = 1;
  }

  transIdDefault += 1;
  var timeString = formatDateTime(DateTime.now(), 'yyMMdd_hhmmss');
  return sprintf('%s%06d', [timeString, transIdDefault]);
}

String getBankCode() => 'zalopayapp';
String getDescription(String apptransid) =>
    'BookReader thanh toán cho đơn hàng  #$apptransid';

String getMacCreateOrder(String data) {
  var hmac = new Hmac(sha256, utf8.encode(ZaloPayConfig.key1));
  return hmac.convert(utf8.encode(data)).toString();
}
