import 'package:fonoapi_dart/fonoapi_dart.dart';
import 'package:fonoapi_dart/src/exceptions.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  final token = "invalidToken";
  FonoApi fonoApi = FonoApi(token);
  test('Throws an InvalidTokenException if the API key is invalid', () async {
    fonoApi.client = MockClient((request) async {
      return Response(
        "{\"status\":\"error\","
            "\"message\":\"Invalid or Blocked Token. Generate a Token at fonoapi.freshpixl.com\","
            "\"innerException\":null, "
            "\"from\" :\"Mock Client\"}",
        200,
      );
    });

    expect(
          () =>
          fonoApi.getDevices(
            brand: "Samsung",
            model: "S10",
          ),
      throwsA(
        InvalidTokenException(
          "Invalid or Blocked Token. Generate a Token at fonoapi.freshpixl.com",
        ),
      ),
    );
  });

  test('Throws a NoMatchingResultsException if there are no matching results',
          () async {
        fonoApi.client = MockClient((request) async {
          return Response(
            "{\"status\":\"error\","
                "\"message\":\"No Matching Results\","
                "\"innerException\":null, "
                "\"from\" :\"Mock Client\"}",
            200,
          );
        });

        expect(
              () =>
              fonoApi.getDevices(
                brand: "Samsung",
                model: "S10",
              ),
          throwsA(
            TypeMatcher<NoMatchingResultsException>(),
          ),
        );
      });

  test('Throws a MissingParameterException if there is a missing parameter',
          () async {
        fonoApi.client = MockClient((request) async {
          return Response(
            "{\"status\":\"error\","
                "\"message\":\"Parameter 'device' missing.\","
                "\"innerException\":null, "
                "\"from\" :\"Mock Client\"}",
            200,
          );
        });

        expect(
              () =>
              fonoApi.getDevices(
                brand: null,
                model: "S10",
              ),
          throwsA(
            TypeMatcher<MissingParameterException>(),
          ),
        );
      });

  test('test that getDevices can return valid results', () async {
    fonoApi.client = MockClient((request) async {
      return Response(
        r"""[{"DeviceName":"Samsung S100","Brand":"Samsung","technology":"GSM",
        "gprs":"Class 8","edge":"No","announced":"2002","status":"Discontinued",
        "dimensions":"89 x 47 x 23 mm, 94 cc (3.50 x 1.85 x 0.91 in)",
        "weight":"92 g (3.25 oz)","sim":"Mini-SIM","type":"STN, 65K colors","resolution":"128 x 160 pixels","display_c":"- Second external display 96 x 64 pixels\r\n  - Four way navigation keys\r\n  - Dynamic font size","card_slot":"No","phonebook":"500 entries, contact groups","call_records":"20 dialed, 20 received, 20 missed calls","camera_c":"No","alert_types":"Vibration; Downloadable polyphonic ringtones, composer","loudspeaker_":"No","wlan":"No","bluetooth":"No","gps":"No","infrared_port":"Yes","radio":"No","messaging":"SMS, EMS","browser":"WAP 1.2.1","clock":"Yes","alarm":"Yes","games":"Yes","java":"Yes","features_c":"- Predictive text input\r\n  - Voice commands and dial\r\n  - Voice memo\r\n  - Organizer\r\n  - Speed dial\r\n  - Menu shortcuts\r\n  - World clock\r\n  - Nokia compatible melodies","battery_c":"Removable Li-Ion battery","stand_by":"180 h","talk_time":"6 h","memory_c":"- Message templates","_2g_bands":"GSM 900 \/ 1800 \/ 1900 ","_3_5mm_jack_":"No"},{"DeviceName":"Samsung Galaxy S10","Brand":"Samsung","technology":"GSM \/ CDMA \/ HSPA \/ EVDO \/ LTE","gprs":"Yes","edge":"Yes","announced":"2019, February","status":"Available. Released 2019, March","dimensions":"149.9 x 70.4 x 7.8 mm (5.90 x 2.77 x 0.31 in)","weight":"157 g (5.54 oz)","sim":"Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)","type":"Dynamic AMOLED capacitive touchscreen, 16M colors","size":"6.1 inches, 93.2 cm2 (~88.3% screen-to-body ratio)","resolution":"1440 x 3040 pixels, 19:9 ratio (~550 ppi density)","display_c":"HDR10+\r\n  Always-on display","card_slot":"microSD, up to 512 GB (uses SIM 2 slot) - dual SIM model only","loudspeaker_":"Yes, with stereo speakers","sound_c":"32-bit\/384kHz audio\r\n  Active noise cancellation with dedicated mic\r\n  Dolby Atmos\/AKG sound","wlan":"Wi-Fi 802.11 a\/b\/g\/n\/ac\/ax, dual-band, Wi-Fi Direct, hotspot","bluetooth":"5.0, A2DP, LE, aptX","gps":"Yes, with A-GPS, GLONASS, BDS, GALILEO","radio":"FM radio (USA & Canada only)","usb":"3.1, Type-C 1.0 reversible connector","features_c":"ANT+\r\n  Bixby natural language commands and dictation\r\n  Samsung DeX (desktop experience support)","battery_c":"Non-removable Li-Ion 3400 mAh battery","colors":"Prism White, Prism Black, Prism Green, Prism Blue, Canary Yellow, Flamingo Pink","sar_eu":"0.48 W\/kg (head) &nbsp; &nbsp; 1.59 W\/kg (body) &nbsp; &nbsp; ","sensors":"Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2","cpu":"Octa-core (2x2.73 GHz Mongoose M4 & 2x2.31 GHz Cortex-A75 & 4x1.95 GHz Cortex-A55) - EMEA\r\nOcta-core (1x2.84 GHz Kryo 485 & 3x2.41 GHz Kryo 485 & 4x1.78 GHz Kryo 485) - USA\/LATAM, China","internal":"128\/512 GB, 8 GB RAM","os":"Android 9.0 (Pie); One UI","body_c":"Samsung Pay (Visa, MasterCard certified)\r\n  IP68 dust\/water proof (up to 1.5m for 30 mins)","video":"2160p@30fps, 1080p@30fps","speed":"HSPA 42.2\/5.76 Mbps, LTE-A (7CA) Cat20 2000\/150 Mbps","network_c":"LTE band 1(2100), 2(1900), 3(1800), 4(1700\/2100), 5(850), 7(2600), 8(900), 12(700), 13(700), 14(700), 17(700), 18(800), 19(800), 20(800), 25(1900), 26(850), 28(700), 29(700), 30(2300), 38(2600), 39(1900), 40(2300), 41(2500), 46, 66(1700\/2100), 71(600) - USA","chipset":"Exynos 9820 Octa (8 nm) - EMEA\r\nQualcomm SDM855 Snapdragon 855 (7 nm) - USA\/LATAM, China","features":"Dual video call, Auto-HDR","protection":"Corning Gorilla Glass 6","gpu":"Mali-G76 MP12 - EMEA\r\n Adreno 640 - USA\/LATAM, China","loudspeaker":"  Voice 82dB \/ Noise 74dB \/ Ring 85dB    ","audio_quality":"  Noise -92.2dB \/ Crosstalk -92.7dB","nfc":"Yes","camera":"  Photo \/ Video","display":"  Contrast ratio: Infinite (nominal), 4.498 (sunlight)","performance":"  Basemark OS II: 4539 \/ Basemark OS II 2.0: 4465\r\nBasemark X: 44097","build":"Back glass (Gorilla Glass 5), aluminum frame","price":"About 770 EUR","sar":"0.93 W\/kg (head) &nbsp; &nbsp; 0.79 W\/kg (body) &nbsp; &nbsp; ","single":"10 MP, f\/1.9, 26mm (wide), 1.22\u00c2\u00b5m, Dual Pixel PDAF","triple":"12 MP, f\/1.5-2.4, 26mm (wide), 1\/2.55\", 1.4\u00c2\u00b5m, Dual Pixel PDAF, OIS\r\n  12 MP, f\/2.4, 52mm (telephoto), 1\/3.6\", 1.0\u00c2\u00b5m, AF, OIS, 2x optical zoom\r\n  16 MP, f\/2.2, 12mm (ultrawide), 1.0\u00c2\u00b5m","charging":"Fast battery charging 15W\r\n  Fast wireless charging 15W\r\n  Power bank\/Reverse wireless charging 9W","_2g_bands":"GSM 850 \/ 900 \/ 1800 \/ 1900 - SIM 1 & SIM 2 (dual-SIM model only)","_3_5mm_jack_":"Yes","_3g_bands":"HSDPA 850 \/ 900 \/ 1700(AWS) \/ 1900 \/ 2100 - Global, USA","_4g_bands":"LTE band 1(2100), 2(1900), 3(1800), 4(1700\/2100), 5(850), 7(2600), 8(900), 12(700), 13(700), 17(700), 18(800), 19(800), 20(800), 25(1900), 26(850), 28(700), 32(1500), 38(2600), 39(1900), 40(2300), 41(2500), 66(1700\/2100) - Global"},{"DeviceName":"Samsung Galaxy S10+","Brand":"Samsung","technology":"GSM \/ CDMA \/ HSPA \/ EVDO \/ LTE","gprs":"Yes","edge":"Yes","announced":"2019, February","status":"Available. Released 2019, March","dimensions":"157.6 x 74.1 x 7.8 mm (6.20 x 2.92 x 0.31 in)","weight":"175 g \/ 198 g (ceramic) (6.17 oz)","sim":"Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)","type":"Dynamic AMOLED capacitive touchscreen, 16M colors","size":"6.4 inches, 103.8 cm2 (~88.9% screen-to-body ratio)","resolution":"1440 x 3040 pixels, 19:9 ratio (~522 ppi density)","display_c":"HDR10+\r\n  Always-on display","card_slot":"microSD, up to 512 GB (uses SIM 2 slot) - dual SIM model only","loudspeaker_":"Yes, with stereo speakers","sound_c":"32-bit\/384kHz audio\r\n  Active noise cancellation with dedicated mic\r\n  Dolby Atmos\/AKG sound","wlan":"Wi-Fi 802.11 a\/b\/g\/n\/ac\/ax, dual-band, Wi-Fi Direct, hotspot","bluetooth":"5.0, A2DP, LE, aptX","gps":"Yes, with A-GPS, GLONASS, BDS, GALILEO","radio":"FM radio (USA & Canada only)","usb":"3.1, Type-C 1.0 reversible connector","features_c":"ANT+\r\n  Bixby natural language commands and dictation\r\n  Samsung DeX (desktop experience support)","battery_c":"Non-removable Li-Ion 4100 mAh battery","colors":"Prism White, Prism Black, Prism Green, Prism Blue, Canary Yellow, Flamingo Pink, Ceramic Black, Ceramic White","sar_eu":"0.52 W\/kg (head) &nbsp; &nbsp; 1.58 W\/kg (body) &nbsp; &nbsp; ","sensors":"Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2","cpu":"Octa-core (2x2.73 GHz Mongoose M4 & 2x2.31 GHz Cortex-A75 & 4x1.95 GHz Cortex-A55) - EMEA\r\nOcta-core (1x2.84 GHz Kryo 485 & 3x2.41 GHz Kryo 485 & 4x1.78 GHz Kryo 485) - USA\/LATAM, China","internal":"1 TB, 12 GB RAM, 128\/512 GB, 8 GB RAM","os":"Android 9.0 (Pie); One UI","body_c":"Samsung Pay (Visa, MasterCard certified)\r\n  IP68 dust\/water proof (up to 1.5m for 30 mins)","video":"2160p@30fps, 1080p@30fps","speed":"HSPA 42.2\/5.76 Mbps, LTE-A (7CA) Cat20 2000\/150 Mbps","network_c":"LTE band 1(2100), 2(1900), 3(1800), 4(1700\/2100), 5(850), 7(2600), 8(900), 12(700), 13(700), 14(700), 17(700), 18(800), 19(800), 20(800), 25(1900), 26(850), 28(700), 29(700), 30(2300), 38(2600), 39(1900), 40(2300), 41(2500), 46, 66(1700\/2100), 71(600) - USA","chipset":"Exynos 9820 Octa (8 nm) - EMEA\r\nQualcomm SDM855 Snapdragon 855 (7 nm) - USA\/LATAM, China","features":"Dual video call, Auto-HDR","protection":"Corning Gorilla Glass 6","gpu":"Mali-G76 MP12 - EMEA\r\n Adreno 640 - USA\/LATAM, China","loudspeaker":"  Voice 74dB \/ Noise 74dB \/ Ring 93dB    ","audio_quality":"  Noise -93.0dB \/ Crosstalk -94.3dB","nfc":"Yes","camera":"  Photo \/ Video","display":"  Contrast ratio: Infinite (nominal), 4.514 (sunlight)","performance":"  Basemark OS II: 4426 \/ Basemark OS II 2.0: 4568\r\nBasemark X: 45017","build":"Front glass (Gorilla Glass 6), back glass (Gorilla Glass 5), aluminum frame\r\nFront glass (Gorilla Glass 6), ceramic body","price":"About 1050 EUR","sar":"1.06 W\/kg (head) &nbsp; &nbsp; 1.03 W\/kg (body) &nbsp; &nbsp; ","triple":"12 MP, f\/1.5-2.4, 26mm (wide), 1\/2.55\", 1.4\u00c2\u00b5m, Dual Pixel PDAF, OIS\r\n  12 MP, f\/2.4, 52mm (telephoto), 1\/3.6\", 1.0\u00c2\u00b5m, AF, OIS, 2x optical zoom\r\n  16 MP, f\/2.2, 12mm (ultrawide), 1.0\u00c2\u00b5m","charging":"Fast battery charging 15W\r\n  Fast wireless charging 15W\r\n  Power bank\/Reverse wireless charging 9W","dual_":"10 MP, f\/1.9, 26mm (wide), 1.22\u00c2\u00b5m, Dual Pixel PDAF\r\n  8 MP, f\/2.2, 22mm (wide), 1.12\u00c2\u00b5m, depth sensor","_2g_bands":"GSM 850 \/ 900 \/ 1800 \/ 1900 - SIM 1 & SIM 2 (dual-SIM model only)","_3_5mm_jack_":"Yes","_3g_bands":"HSDPA 850 \/ 900 \/ 1700(AWS) \/ 1900 \/ 2100 - Global, USA","_4g_bands":"LTE band 1(2100), 2(1900), 3(1800), 4(1700\/2100), 5(850), 7(2600), 8(900), 12(700), 13(700), 17(700), 18(800), 19(800), 20(800), 25(1900), 26(850), 28(700), 32(1500), 38(2600), 39(1900), 40(2300), 41(2500), 66(1700\/2100) - Global"},{"DeviceName":"Samsung Galaxy S10e","Brand":"Samsung","technology":"GSM \/ CDMA \/ HSPA \/ EVDO \/ LTE","gprs":"Yes","edge":"Yes","announced":"2019, February","status":"Available. Released 2019, March","dimensions":"142.2 x 69.9 x 7.9 mm (5.60 x 2.75 x 0.31 in)","weight":"150 g (5.29 oz)","sim":"Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)","type":"Dynamic AMOLED capacitive touchscreen, 16M colors","size":"5.8 inches, 82.8 cm2 (~83.3% screen-to-body ratio)","resolution":"1080 x 2280 pixels, 19:9 ratio (~438 ppi density)","display_c":"HDR10+\r\n  Always-on display","card_slot":"microSD, up to 512 GB (uses SIM 2 slot) - dual SIM model only","loudspeaker_":"Yes, with stereo speakers","sound_c":"32-bit\/384kHz audio\r\n  Active noise cancellation with dedicated mic\r\n  Dolby Atmos\/AKG sound","wlan":"Wi-Fi 802.11 a\/b\/g\/n\/ac\/ax, dual-band, Wi-Fi Direct, hotspot","bluetooth":"5.0, A2DP, LE, aptX","gps":"Yes, with A-GPS, GLONASS, BDS, GALILEO","radio":"FM radio (USA & Canada only)","usb":"3.1, Type-C 1.0 reversible connector","features_c":"ANT+\r\n  Bixby natural language commands and dictation","battery_c":"Non-removable Li-Ion 3100 mAh battery","colors":"Prism White, Prism Black, Prism Green, Prism Blue, Canary Yellow, Flamingo Pink","sar_eu":"0.58 W\/kg (head) &nbsp; &nbsp; 1.57 W\/kg (body) &nbsp; &nbsp; ","sensors":"Fingerprint (side-mounted), accelerometer, gyro, proximity, compass, barometer","cpu":"Octa-core (2x2.73 GHz Mongoose M4 & 2x2.31 GHz Cortex-A75 & 4x1.95 GHz Cortex-A55) - EMEA\r\nOcta-core (1x2.84 GHz Kryo 485 & 3x2.41 GHz Kryo 485 & 4x1.78 GHz Kryo 485) - USA\/LATAM, China","internal":"256 GB, 8 GB RAM or 128 GB, 6 GB RAM","os":"Android 9.0 (Pie); One UI","body_c":"Samsung Pay (Visa, MasterCard certified)\r\n  IP68 dust\/water proof (up to 1.5m for 30 mins)","video":"2160p@30fps, 1080p@30fps","speed":"HSPA 42.2\/5.76 Mbps, LTE-A (7CA) Cat20 2000\/150 Mbps","network_c":"LTE band 1(2100), 2(1900), 3(1800), 4(1700\/2100), 5(850), 7(2600), 8(900), 12(700), 13(700), 14(700), 17(700), 18(800), 19(800), 20(800), 25(1900), 26(850), 28(700), 29(700), 30(2300), 38(2600), 39(1900), 40(2300), 41(2500), 46, 66(1700\/2100), 71(600) - USA","chipset":"Exynos 9820 Octa (8 nm) - EMEA\r\nQualcomm SDM855 Snapdragon 855 (7 nm) - USA\/LATAM, China","features":"Dual video call, Auto-HDR","protection":"Corning Gorilla Glass 5","gpu":"Mali-G76 MP12 - EMEA\r\nAdreno 640 - USA\/LATAM, China","loudspeaker":"  Voice 71dB \/ Noise 76dB \/ Ring 80dB    ","audio_quality":"  Noise -92.9dB \/ Crosstalk -89.4dB","nfc":"Yes","camera":"  Photo \/ Video","display":"  Contrast ratio: infinite","performance":"  Basemark OS II: 4286 \/ Basemark OS II 2.0: 4470\r\nBasemark X: 44059","build":"Front\/back glass (Gorilla Glass 5), aluminum frame","price":"About 680 EUR","sar":"0.56 W\/kg (head) &nbsp; &nbsp; 0.70 W\/kg (body) &nbsp; &nbsp; ","single":"10 MP, f\/1.9, 26mm (wide), 1.22\u00c2\u00b5m, Dual Pixel PDAF","charging":"Fast battery charging 15W\r\n  Fast wireless charging 15W\r\n  Power bank\/Reverse wireless charging 9W","dual_":"12 MP, f\/1.5-2.4, 26mm (wide), 1\/2.55\", 1.4\u00c2\u00b5m, Dual Pixel PDAF, OIS\r\n  16 MP, f\/2.2, 12mm (ultrawide), 1.0\u00c2\u00b5m","_2g_bands":"GSM 850 \/ 900 \/ 1800 \/ 1900 - SIM 1 & SIM 2 (dual-SIM model only)","_3_5mm_jack_":"Yes","_3g_bands":"HSDPA 850 \/ 900 \/ 1700(AWS) \/ 1900 \/ 2100 - Global, USA","_4g_bands":"LTE band 1(2100), 2(1900), 3(1800), 4(1700\/2100), 5(850), 7(2600), 8(900), 12(700), 13(700), 17(700), 18(800), 19(800), 20(800), 25(1900), 26(850), 28(700), 32(1500), 38(2600), 39(1900), 40(2300), 41(2500), 66(1700\/2100) - Global"},{"DeviceName":"Samsung Galaxy S10 5G","Brand":"Samsung","technology":"GSM \/ CDMA \/ HSPA \/ EVDO \/ LTE","gprs":"Yes","edge":"Yes","announced":"2019, February","status":"Coming soon. Exp. release 2019, April 5","dimensions":"162.6 x 77.1 x 7.9 mm (6.40 x 3.04 x 0.31 in)","weight":"198 g (6.98 oz)","sim":"Nano-SIM","type":"Dynamic AMOLED capacitive touchscreen, 16M colors","size":"6.7 inches, 112.0 cm2 (~89.4% screen-to-body ratio)","resolution":"1440 x 3040 pixels, 19:9 ratio (~502 ppi density)","display_c":"HDR10+\r\n  Always-on display","card_slot":"No","loudspeaker_":"Yes, with stereo speakers","sound_c":"32-bit\/384kHz audio\r\n  Active noise cancellation with dedicated mic\r\n  Dolby Atmos\/AKG sound","wlan":"Wi-Fi 802.11 a\/b\/g\/n\/ac\/ax, dual-band, Wi-Fi Direct, hotspot","bluetooth":"5.0, A2DP, LE, aptX","gps":"Yes, with A-GPS, GLONASS, BDS, GALILEO","radio":"FM radio (USA & Canada only)","usb":"3.1, Type-C 1.0 reversible connector","features_c":"ANT+\r\n  Bixby natural language commands and dictation\r\n  Samsung DeX (desktop experience support)","battery_c":"Non-removable Li-Ion 4500 mAh battery","colors":"Prism White","sensors":"Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2","cpu":"Octa-core (2x2.73 GHz Mongoose M4 & 2x2.31 GHz Cortex-A75 & 4x1.95 GHz Cortex-A55) - EMEA\r\nOcta-core (1x2.84 GHz Kryo 485 & 3x2.41 GHz Kryo 485 & 4x1.78 GHz Kryo 485) - USA\/LATAM, China","internal":"256 GB, 8 GB RAM","os":"Android 9.0 (Pie); One UI","body_c":"Samsung Pay (Visa, MasterCard certified)\r\n  IP68 dust\/water proof (up to 1.5m for 30 mins)","video":"2160p@30fps, 1080p@30fps","speed":"HSPA 42.2\/5.76 Mbps, LTE-A (7CA) Cat20 2000\/150 Mbps; 5G","network_c":" (5G capable)","chipset":"Exynos 9820 Octa (8 nm) - EMEA\r\nQualcomm SDM855 Snapdragon 855 (7 nm) - USA\/LATAM, China","features":"Dual video call, Auto-HDR","protection":"Corning Gorilla Glass 6","gpu":"Mali-G76 MP12 - EMEA\r\n Adreno 640 - USA\/LATAM, China","nfc":"Yes","build":"Front\/back glass (Gorilla Glass 6), aluminum frame","charging":"Fast battery charging 25W (USB Power Delivery 3.0)\r\n  Fast wireless charging 15W\r\n  Power bank\/Reverse wireless charging 9W","quad":"12 MP, f\/1.5-2.4, 26mm (wide), 1\/2.55\", 1.4\u00c2\u00b5m, Dual Pixel PDAF, OIS\r\n  12 MP, f\/2.4, 52mm (telephoto), 1\/3.6\", 1.0\u00c2\u00b5m, AF, OIS, 2x optical zoom\r\n  16 MP, f\/2.2, 12mm (ultrawide)\r\n  TOF camera","dual_":"10 MP, f\/1.9, 26mm (wide), Dual Pixel PDAF\r\n  TOF camera","_2g_bands":"GSM 850 \/ 900 \/ 1800 \/ 1900 ","_3_5mm_jack_":"Yes","_3g_bands":"HSDPA 850 \/ 900 \/ 1700(AWS) \/ 1900 \/ 2100 ","_4g_bands":" LTE"}]""",
        200,
      );
    });

    List<Device> devices = await fonoApi.getDevices(
      brand: "Samsung",
      model: "S10",
    );

    expect(
      devices,
      contains(
        deviceFromJson(
            r'{"DeviceName":"Samsung S100","Brand":"Samsung","technology":"GSM","gprs":"Class 8","edge":"No","announced":"2002","status":"Discontinued","dimensions":"89 x 47 x 23 mm, 94 cc (3.50 x 1.85 x 0.91 in)","weight":"92 g (3.25 oz)","sim":"Mini-SIM","type":"STN, 65K colors","resolution":"128 x 160 pixels","display_c":"- Second external display 96 x 64 pixels\r\n  - Four way navigation keys\r\n  - Dynamic font size","card_slot":"No","phonebook":"500 entries, contact groups","call_records":"20 dialed, 20 received, 20 missed calls","camera_c":"No","alert_types":"Vibration; Downloadable polyphonic ringtones, composer","loudspeaker_":"No","wlan":"No","bluetooth":"No","gps":"No","infrared_port":"Yes","radio":"No","messaging":"SMS, EMS","browser":"WAP 1.2.1","clock":"Yes","alarm":"Yes","games":"Yes","java":"Yes","features_c":"- Predictive text input\r\n  - Voice commands and dial\r\n  - Voice memo\r\n  - Organizer\r\n  - Speed dial\r\n  - Menu shortcuts\r\n  - World clock\r\n  - Nokia compatible melodies","battery_c":"Removable Li-Ion battery","stand_by":"180 h","talk_time":"6 h","memory_c":"- Message templates","_2g_bands":"GSM 900 / 1800 / 1900 ","_3_5mm_jack_":"No"}'),
      ),
    );
  });
}
