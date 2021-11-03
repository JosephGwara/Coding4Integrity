import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallets/models/models.dart';

abstract class BlockScoutApi {
  Future<double> getWalletBalance(String address);
  Future<List<Transaction>> listTransactionsForWallet(String address);

  factory BlockScoutApi() = _BlockScoutApi;
}

class _BlockScoutApi implements BlockScoutApi {
  @override
  Future<double> getWalletBalance(String address) async {
    final endpoint = "https://alfajores-blockscout.celo-testnet.org/api?"
        "module=account&action=tokenbalance&contractaddress=0x8D222281967aa33315dE3F422cD11787baEbFd97"
        "&address=$address";

    final response = await http.get(Uri.parse(endpoint));
    return double.parse(parseResponse(response.body));
  }

  @override
  Future<List<Transaction>> listTransactionsForWallet(String address) {
    // TODO: implement listTransactionsForWallet
    throw UnimplementedError();
  }

  dynamic parseResponse(String responseBody) {
    print(responseBody);

    final jsonResponse = json.decode(responseBody);
    if (jsonResponse["status"] == "0")
      throw StateError(jsonResponse["message"]);

    return jsonResponse["result"];
  }
}
