A dart client for FonoAPI.

This is a small API which can provide descriptions
of Mobile Devices such as model, brand, processor, weight etc.

## Usage

A simple usage example:

```dart
import 'package:fonoapi_dart/fonoapi_dart.dart';

main() async {
    String token = "YOUR_API_TOKEN";
  
    final FonoApi fonoApi = FonoApi(token);
  
    final List<Device> devices = await fonoApi.getDevices(
      brand: "Samsung",
      model: "S10",
    );

}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/thinkdigitalsoftware/fonoapi-dart/issues).

