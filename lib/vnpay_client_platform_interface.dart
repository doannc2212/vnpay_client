import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'vnpay_client_method_channel.dart';

abstract class VnpayClientPlatform extends PlatformInterface {
  /// Constructs a VnpayClientPlatform.
  VnpayClientPlatform() : super(token: _token);

  static final Object _token = Object();

  static VnpayClientPlatform _instance = MethodChannelVnpayClient();

  /// The default instance of [VnpayClientPlatform] to use.
  ///
  /// Defaults to [MethodChannelVnpayClient].
  static VnpayClientPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VnpayClientPlatform] when
  /// they register themselves.
  static set instance(VnpayClientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
