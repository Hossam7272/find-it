import 'package:qr_flutter/qr_flutter.dart';

class MyQrCode{
  static var qrCode;


  static setQrCode({required String data , required String phone}){
    qrCode = QrImageView(data: '$data : $phone',size: 200,);
  }
}