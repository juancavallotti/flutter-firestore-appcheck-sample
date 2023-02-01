import 'package:firebase_remote_config/firebase_remote_config.dart';

final config = FirebaseRemoteConfig.instance;

Future<void> initializeRemoteConfig() async {
  await config.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await config.setDefaults(const {
    "allow_delete": false,
  });
}
