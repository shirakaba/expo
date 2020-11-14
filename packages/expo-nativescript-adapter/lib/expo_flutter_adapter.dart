import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

const _methodChannel = MethodChannel('flutter_adapter.expo.io/method_calls');

const _eventsChannel = EventChannel('flutter_adapter.expo.io/events');

class ExpoEvent {
  final String name;
  final Map<String, dynamic> body;

  ExpoEvent(this.name, this.body);
}

class ExpoModulesProxy {
  /// Call a method exposed by an Expo module. The returned [Future] is
  /// completed with the return value of the method call, or throws an error if
  /// the native module call failed.
  static Future<dynamic> callMethod(String moduleName, String methodName,
      [List<dynamic> arguments = const []]) async {
    if (Platform.isIOS) {
      Map result = await _methodChannel.invokeMethod('callMethod', {
        'moduleName': moduleName,
        'methodName': methodName,
        'arguments': arguments,
      });

      if (result["status"] == "error") {
        throw result;
      } else {
        return result["payload"];
      }
    } else {
      return await _methodChannel.invokeMethod('callMethod', {
        'moduleName': moduleName,
        'methodName': methodName,
        'arguments': arguments,
      });
    }
  }

  // Get a constant exposed by an Expo module.
  static Future<dynamic> getConstant(
          String moduleName, String constantName) async =>
      _methodChannel.invokeMethod('getConstant', {
        'moduleName': moduleName,
        'constantName': constantName,
      });

  /// A broadcast [Stream] of events from Expo native modules.
  static Stream<ExpoEvent> get events {
    if (_events == null) {
      _events = _eventsChannel.receiveBroadcastStream().map((dynamic e) {
        return new ExpoEvent(e['eventName'], e['body'].cast<String, dynamic>());
      });
    }
    return _events;
  }

  static Stream<ExpoEvent> _events;
}
