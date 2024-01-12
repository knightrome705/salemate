class AppException implements Exception{
  final message,prefix;
  AppException([this.message,this.prefix]);

  @override
  String toString(){
    return '$prefix$message';
  }


}
class FetchDataException extends AppException{
  FetchDataException({String? message}):super(message,"Error during communication");
}
class UnAuthroizedException extends AppException{
  UnAuthroizedException({String? message}):super(message,"Error during communication");
}