import 'package:web3dart/web3dart.dart';

abstract class CredentialsService {
  Future<String> walletPrivateKeyToPublicKey(String privateKeyHex);

  factory CredentialsService() = _CredentialsService;
}

class _CredentialsService implements CredentialsService {
  @override
  Future<String> walletPrivateKeyToPublicKey(String privateKeyHex) async {
    final credentials = EthPrivateKey.fromHex(privateKeyHex);
    final address = await credentials.extractAddress();
    return address.hex;
  }
}
