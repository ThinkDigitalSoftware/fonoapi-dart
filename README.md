A dart client for FonoAPI.

This is a small API which can provide descriptions
of Mobile Devices such as model, brand, processor, weight etc.
https://fonoapi.freshpixl.com/


This is an API which can provide mobile device descriptions 
such as model, brand, CPU, GPU, dimensions, 
release date etc. It might be helpful if you are building 
a website like GSMArena, PhoneArena or something similar. 
This API contains a database of a mobile device descriptions 
of Android, iOS and some old phones too.. :D

### API

API URL: https://fonoapi.freshpixl.com/v1/

###### Method `getdevice` (https://fonoapi.freshpixl.com/v1/getdevice)

Available options
  - brand - 
       Pass the Mobile Device Brand (example : "Samsung", "OnePlus")
  - model - 
       Pass the device name (example : "S10", "G7") 
       This might result multiple results at a time.
  - position -
       When a set of results is returned you can get a specific device by passing the position of your device on the result set. count starts from 0
  - token -
        You will need a token to access the Api. no registration, nothing, just grab the key.
        You can get it here https://fonoapi.freshpixl.com/token/generate

Available options
  - brand - 
       It gives the latest you can filter the brand (example : "samsung", "htc")
  - limit - 
       Limit the result count (Max 100)
  - token* -
       You will need a token to access the Api. no registration, nothing, just grab the key.<br>
       You can get it here https://fonoapi.freshpixl.com/token/generate

<strong>Note:</strong> the API will return only 100 devices per request
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

