import 'package:url_launcher/url_launcher.dart';

abstract class PaymentsService {
  Future<void> makePayment({required double amount, required String toAddress});

  factory PaymentsService() = _PaymentsService;
}

class _PaymentsService implements PaymentsService {
  @override
  Future<void> makePayment(
      {required double amount, required String toAddress}) {
    final deepLink =
        "https://metamask.app.link/send/pay-0x8D222281967aa33315dE3F422cD11787baEbFd97/"
        "transfer?address=$toAddress&uint256=${amount}e18";

    return launch(deepLink);
  }
}
