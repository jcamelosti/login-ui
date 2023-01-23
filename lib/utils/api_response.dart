class ApiResponse<T> {
  late bool ok;
  late String msg;
  late T result;

  ApiResponse.ok({required this.result, required this.msg}) {
    ok = true;
  }

  ApiResponse.error({required this.result, required this.msg}) {
    ok = false;
  }
}