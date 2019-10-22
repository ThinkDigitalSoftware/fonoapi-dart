import 'package:fonoapi_dart/fonoapi_dart.dart';
import 'package:fonoapi_dart/src/models/device.dart';

import 'secrets.dart';

main() async {
  final FonoApi fonoApi = FonoApi(token);

  final List<Device> devices =
  await fonoApi.getDevices(brand: "Samsung", model: "S10");

  devices.forEach(print);
}
