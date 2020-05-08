import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@registerModule
abstract class InjectableModule {
  Dio get dio => Dio();
}
