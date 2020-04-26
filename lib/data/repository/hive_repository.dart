import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:ncov_tracker_ph/data/models/patient.dart';
import 'package:ncov_tracker_ph/data/models/residence.dart';

@injectable
@lazySingleton
class HiveRepository {
  Future<void> storeAppState() async {
    final box = await Hive.openBox('app_state');
    final bool isAppOpenedOnce =
        box.get('isAppOpenedOnce', defaultValue: false);
    if (!isAppOpenedOnce) {
      box.put('isAppOpenedOnce', true);
    }
  }

  Future<bool> fetchAppState() async {
    final box = await Hive.openBox('app_state');
    final bool isAppOpenedOnce =
        box.get('isAppOpenedOnce', defaultValue: false);

    return isAppOpenedOnce;
  }

  Future<bool> isLocalStorageEmpty() async {
    final box = await Hive.openBox('patients');
    final List<dynamic> data = box.get('currentPatients', defaultValue: []);

    return (data.isEmpty) ? true : false;
  }

  Future<void> storeCurrentCases(List<Patient> patients) async {
    final box = await Hive.openBox('patients');
    await box.put(
        'currentPatients',
        patients
            .map((e) => {
                  'caseNumber': e.caseNumber,
                  'sex': e.sex,
                  'age': e.age,
                  'dateDeath': e.dateDeath,
                  'dateRecovery': e.dateRecovery,
                  'dateReportConfirmed': e.dateReportConfirmed,
                  'dateReportRemoved': e.dateReportRemoved,
                  'admitted': e.admitted,
                  'healthStatus': e.healthStatus,
                  'removalType': e.removalType,
                  'residence': e.residence.toJson(),
                })
            .toList());
  }

  Future<List<Patient>> fetchCurrentCasesFromLocal() async {
    final box = await Hive.openBox('patients');
    final List<dynamic> rawData = box.get('currentPatients');

    return rawData
        .map((e) => Patient(
              caseNumber: e['caseNumber'] ?? "For Validation",
              sex: e['sex'] ?? "For Validation",
              age: e['age'] ?? 0,
              dateDeath: e['dateDeath'] ?? "For Validation",
              dateRecovery: e['dateRecovery'] ?? "For Validation",
              dateReportConfirmed: e['dateReportConfirmed'] ?? "For Validation",
              dateReportRemoved: e['dateReportRemoved'] ?? "For Validation",
              admitted: e['admitted'] ?? "For Validation",
              healthStatus: e['healthStatus'] ?? "For Validation",
              removalType: e['removalType'] ?? "For Validation",
              residence: Residence(
                city: e['residence']['city'] ?? "For Validation",
                province: e['residence']['province'] ?? "For Validation",
                region: e['residence']['region'] ?? "For Validation",
              ),
            ))
        .toList();
  }
}
