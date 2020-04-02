import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@registerModule
abstract class InjectableModule {
  @lazySingleton
  Dio get dio => Dio();
}
