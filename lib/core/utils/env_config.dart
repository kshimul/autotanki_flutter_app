/// Environment configuration loaded at build time via --dart-define
/// Usage:
///   flutter run --dart-define=ENV=dev --dart-define=BASE_URL=https://api.dev.example.com
///   flutter run --dart-define=ENV=prod --dart-define=BASE_URL=https://api.example.com
class EnvConfig {
  EnvConfig._();

  static const String environment = String.fromEnvironment(
    'ENV',
    defaultValue: 'dev',
  );

  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue:
        'https://glad-responsible-musical-chances.trycloudflare.com', // Android emulator → localhost
  );

  static const String mqttBrokerUrl = String.fromEnvironment(
    'MQTT_BROKER_URL',
    defaultValue:
        'mqtts://f2787211.ala.asia-southeast1.emqxsl.com:8883', // WSS on port 443 in production
  );

  static const String mqttBrokerPort = String.fromEnvironment(
    'MQTT_PORT',
    defaultValue: '8883',
  );

  // Firebase is configured via google-services.json / GoogleService-Info.plist
  // No secrets needed here.

  static bool get isProduction => environment == 'prod';
  static bool get isDevelopment => environment == 'dev';
}
