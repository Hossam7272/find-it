import 'package:find_it/features/auth/signup/logic/set_qr_code.dart';
import 'package:flutter/material.dart';

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyQrCode.qrCode,
      ),
    );
  }
}
