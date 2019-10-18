import 'dart:convert';

import 'package:fonoapi_dart/src/exceptions.dart';
import 'package:fonoapi_dart/src/models/device.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class FonoApi {
  /// You will need a token to access the Api. no registration, nothing, just grab the key.
  /// You can get it here https://fonoapi.freshpixl.com/token/generate
  final String apiToken;
  static const String _apiUrl = 'https://fonoapi.freshpixl.com/v1/getdevice';

  FonoApi(this.apiToken);

  /// Gets a List of [Device]s based on the below criteria.
  ///
  /// This function may return one or multiple results. For stability purposes,
  /// this will always return a list, even if there is only one result.
  ///
  /// brand - Pass the Mobile Device Brand (example : "samsung", "htc")
  /// model -  Mobile device name (example : "i9305", "A8").
  /// position (Optional) - When a set of results is returned you can get a specific device by passing the position of your device on the result set. count starts from 0
  Future<List<Device>> getDevices({
    @required String brand,
    @required String model,
    int position,
  }) async {
    final result = await post("$_apiUrl",
        body: {
          'brand': brand,
          'device': model,
          'position': position?.toString(),
          'token': apiToken,
        }..removeWhere((key, value) => value == null));

    final resultJson = jsonDecode(result.body);

    if (result is Map && resultJson['status'] == 'error') {
      throw MissingParameterException(resultJson['message']);
    }
    if (resultJson is Map) {
      return [Device.fromJson(resultJson)];
    } else {
      return [for (final deviceJson in resultJson) Device.fromJson(deviceJson)];
    }
  }
}
