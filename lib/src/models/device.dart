import 'dart:convert';

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));

String deviceToJson(Device data) => json.encode(data.toJson());

class Device {
  final String deviceName;
  final String brand;
  final String technology;
  final String gprs;
  final String edge;
  final String announced;
  final String status;
  final String dimensions;
  final String weight;
  final String sim;
  final String type;
  final String resolution;
  final String displayC;
  final String cardSlot;
  final String phonebook;

  final String callRecords;
  final String cameraC;
  final String alertTypes;
  final String loudspeaker;
  final String wlan;
  final String bluetooth;
  final String gps;
  final String infraredPort;
  final String radio;
  final String messaging;
  final String browser;
  final String clock;
  final String alarm;
  final String games;
  final String java;
  final String featuresC;
  final String batteryC;
  final String standBy;
  final String talkTime;
  final String memoryC;
  final String the2GBands;
  final String the35MmJack;

  Device({
    this.deviceName,
    this.brand,
    this.technology,
    this.gprs,
    this.edge,
    this.announced,
    this.status,
    this.dimensions,
    this.weight,
    this.sim,
    this.type,
    this.resolution,
    this.displayC,
    this.cardSlot,
    this.phonebook,
    this.callRecords,
    this.cameraC,
    this.alertTypes,
    this.loudspeaker,
    this.wlan,
    this.bluetooth,
    this.gps,
    this.infraredPort,
    this.radio,
    this.messaging,
    this.browser,
    this.clock,
    this.alarm,
    this.games,
    this.java,
    this.featuresC,
    this.batteryC,
    this.standBy,
    this.talkTime,
    this.memoryC,
    this.the2GBands,
    this.the35MmJack,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        deviceName: json["DeviceName"],
        brand: json["Brand"],
        technology: json["technology"],
        gprs: json["gprs"],
        edge: json["edge"],
        announced: json["announced"],
        status: json["status"],
        dimensions: json["dimensions"],
        weight: json["weight"],
        sim: json["sim"],
        type: json["type"],
        resolution: json["resolution"],
        displayC: json["display_c"],
        cardSlot: json["card_slot"],
        phonebook: json["phonebook"],
        callRecords: json["call_records"],
        cameraC: json["camera_c"],
        alertTypes: json["alert_types"],
        loudspeaker: json["loudspeaker_"],
        wlan: json["wlan"],
        bluetooth: json["bluetooth"],
        gps: json["gps"],
        infraredPort: json["infrared_port"],
        radio: json["radio"],
        messaging: json["messaging"],
        browser: json["browser"],
        clock: json["clock"],
        alarm: json["alarm"],
        games: json["games"],
        java: json["java"],
        featuresC: json["features_c"],
        batteryC: json["battery_c"],
        standBy: json["stand_by"],
        talkTime: json["talk_time"],
        memoryC: json["memory_c"],
        the2GBands: json["_2g_bands"],
        the35MmJack: json["_3_5mm_jack_"],
      );

  Map<String, dynamic> toJson() => {
        "DeviceName": deviceName,
        "Brand": brand,
        "technology": technology,
        "gprs": gprs,
        "edge": edge,
        "announced": announced,
        "status": status,
        "dimensions": dimensions,
        "weight": weight,
        "sim": sim,
        "type": type,
        "resolution": resolution,
        "display_c": displayC,
        "card_slot": cardSlot,
        "phonebook": phonebook,
        "call_records": callRecords,
        "camera_c": cameraC,
        "alert_types": alertTypes,
        "loudspeaker_": loudspeaker,
        "wlan": wlan,
        "bluetooth": bluetooth,
        "gps": gps,
        "infrared_port": infraredPort,
        "radio": radio,
        "messaging": messaging,
        "browser": browser,
        "clock": clock,
        "alarm": alarm,
        "games": games,
        "java": java,
        "features_c": featuresC,
        "battery_c": batteryC,
        "stand_by": standBy,
        "talk_time": talkTime,
        "memory_c": memoryC,
        "_2g_bands": the2GBands,
        "_3_5mm_jack_": the35MmJack,
      };

  @override
  String toString() {
    return 'Device{deviceName: $deviceName, brand: $brand}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Device &&
              runtimeType == other.runtimeType &&
              deviceName == other.deviceName &&
              brand == other.brand &&
              technology == other.technology &&
              gprs == other.gprs &&
              edge == other.edge &&
              announced == other.announced &&
              status == other.status &&
              dimensions == other.dimensions &&
              weight == other.weight &&
              sim == other.sim &&
              type == other.type &&
              resolution == other.resolution &&
              displayC == other.displayC &&
              cardSlot == other.cardSlot &&
              phonebook == other.phonebook &&
              callRecords == other.callRecords &&
              cameraC == other.cameraC &&
              alertTypes == other.alertTypes &&
              loudspeaker == other.loudspeaker &&
              wlan == other.wlan &&
              bluetooth == other.bluetooth &&
              gps == other.gps &&
              infraredPort == other.infraredPort &&
              radio == other.radio &&
              messaging == other.messaging &&
              browser == other.browser &&
              clock == other.clock &&
              alarm == other.alarm &&
              games == other.games &&
              java == other.java &&
              featuresC == other.featuresC &&
              batteryC == other.batteryC &&
              standBy == other.standBy &&
              talkTime == other.talkTime &&
              memoryC == other.memoryC &&
              the2GBands == other.the2GBands &&
              the35MmJack == other.the35MmJack;

  @override
  int get hashCode =>
      deviceName.hashCode ^
      brand.hashCode ^
      technology.hashCode ^
      gprs.hashCode ^
      edge.hashCode ^
      announced.hashCode ^
      status.hashCode ^
      dimensions.hashCode ^
      weight.hashCode ^
      sim.hashCode ^
      type.hashCode ^
      resolution.hashCode ^
      displayC.hashCode ^
      cardSlot.hashCode ^
      phonebook.hashCode ^
      callRecords.hashCode ^
      cameraC.hashCode ^
      alertTypes.hashCode ^
      loudspeaker.hashCode ^
      wlan.hashCode ^
      bluetooth.hashCode ^
      gps.hashCode ^
      infraredPort.hashCode ^
      radio.hashCode ^
      messaging.hashCode ^
      browser.hashCode ^
      clock.hashCode ^
      alarm.hashCode ^
      games.hashCode ^
      java.hashCode ^
      featuresC.hashCode ^
      batteryC.hashCode ^
      standBy.hashCode ^
      talkTime.hashCode ^
      memoryC.hashCode ^
      the2GBands.hashCode ^
      the35MmJack.hashCode;
}
