import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ncov_tracker_ph/injection.iconfig.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection() => $initGetIt(getIt);
