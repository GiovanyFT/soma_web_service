class ApiResponse<T>{
  bool? ok;
  String? msg;
  T? resultado = null;

  ApiResponse.ok(this.resultado){
    ok = true;
  }

  ApiResponse.error(this.msg){
    ok = false;
  }
}