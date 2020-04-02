import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@registerModule
abstract class IFirebaseRemoteService {
  Future<RemoteConfig> get remoteConfig => RemoteConfig.instance;
}

@injectable
@RegisterAs(IFirebaseRemoteService)
class FirebaseRemoteService implements IFirebaseRemoteService {
  @override
  Future<RemoteConfig> get remoteConfig => RemoteConfig.instance;
}
