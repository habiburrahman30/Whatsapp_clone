// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoint {
  static String getTransportOrderUrl() {
    return '${dotenv.env['BASE_URL_WFC']}/v1/transport-order';
  }
}
