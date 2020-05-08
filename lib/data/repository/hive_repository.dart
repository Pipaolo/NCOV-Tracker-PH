import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/ncov_statistic_basic.dart';
import '../models/patient.dart';
import '../models/residence.dart';

@injectable
@lazySingleton
class HiveRepository {
  Future<void> storeAppState() async {
    final appStateBox = await Hive.openBox('app_state');
    final bool isAppOpenedOnce =
        appStateBox.get('isAppOpenedOnce', defaultValue: false);
    if (!isAppOpenedOnce) {
      appStateBox.put('isAppOpenedOnce', true);
    }
  }

  Future<bool> isCurrentStatisticLocalStored() async {
    final casesBox = await Hive.openBox('patients');
    final currentStatistic = casesBox.get('currentStatistics');

    return (currentStatistic != null) ? true : false;
  }

  Future<NcovStatisticBasic> fetchCurrentStatisticsLocal() async {
    final casesBox = await Hive.openBox('patients');
    final currentStatistic = casesBox.get('currentStatistics');

    if (currentStatistic != null) {
      return NcovStatisticBasic(
        totalDeaths: currentStatistic['totalDeaths'],
        totalInfected: currentStatistic['totalInfected'],
        totalRecovered: currentStatistic['totalRecovered'],
        totalTestsConducted: currentStatistic['totalTestsConducted'],
        prevTestsConducted: currentStatistic['prevTestsConducted'],
        prevDeaths: currentStatistic['prevDeaths'],
        prevInfected: currentStatistic['prevInfected'],
        prevRecovered: currentStatistic['prevRecovered'],
      );
    } else {
      return null;
    }
  }

  Future<void> storeCurrentStatistics(
      NcovStatisticBasic currentStatistics) async {
    final casesBox = await Hive.openBox('patients');
    return casesBox.put('currentStatistics', currentStatistics.toJson());
  }

  Future<bool> fetchAppState() async {
    final appStateBox = await Hive.openBox('app_state');
    final bool isAppOpenedOnce =
        appStateBox.get('isAppOpenedOnce', defaultValue: false);

    return isAppOpenedOnce;
  }

  Future<bool> isLocalStorageEmpty() async {
    final casesBox = await Hive.openBox('patients');
    final List<dynamic> data =
        casesBox.get('currentPatients', defaultValue: []);

    return (data.isEmpty) ? true : false;
  }

  Future<void> storeCurrentCases(List<Patient> patients) async {
    final casesBox = await Hive.openBox('patients');
    await casesBox.put(
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
    final casesBox = await Hive.openBox('patients');
    final List<dynamic> rawData = casesBox.get('currentPatients');
    final List<Patient> patients = rawData
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
    patients
        .sort((a, b) => b.dateReportConfirmed.compareTo(a.dateReportConfirmed));
    return patients;
  }
}
