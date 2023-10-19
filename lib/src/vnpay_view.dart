import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VNPayView extends StatefulWidget {
  const VNPayView({
    required this.paymentUrl,
    super.key,
    this.onPaymentSuccess,
    this.onPaymentError,
  });
  final String paymentUrl;
  final void Function(Map<String, dynamic> value)? onPaymentSuccess;
  final void Function(Map<String, dynamic> error)? onPaymentError;

  @override
  State<VNPayView> createState() => VNPayViewState();
}

class VNPayViewState extends State<VNPayView> {
  final WebViewController controller = WebViewController();

  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            if (url.contains('vnp_ResponseCode')) {
              final params = Uri.parse(url).queryParameters;
              if (params['vnp_ResponseCode'] == '00') {
                widget.onPaymentSuccess?.call(params);
              } else {
                widget.onPaymentError?.call(params);
              }
              Navigator.of(context).pop();
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
