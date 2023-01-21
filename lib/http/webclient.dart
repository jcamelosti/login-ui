import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:login_ui/http/interceptors/logging_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 5),
);

const String baseUrl = 'https://odontoapi.josuecamelo.com/api';

class HttpException implements Exception {
  final String? message;

  HttpException(this.message);
}