import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'vnpay_client_platform_interface.dart';

/// An implementation of [VnpayClientPlatform] that uses method channels.
class MethodChannelVnpayClient extends VnpayClientPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('vnpay_client');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
