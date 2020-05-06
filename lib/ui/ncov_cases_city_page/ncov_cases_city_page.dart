import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/patient.dart';
import 'bloc/filtered_cases_bloc.dart';
import 'widgets/case_card_widget.dart';

class NcovCasesCityPage extends StatelessWidget implements AutoRouteWrapper {
  final List<Patient> patients;
  final String city;
  const NcovCasesCityPage({Key key, this.patients, this.city})
      : super(key: key);

  @override
  Widget wrappedRoute(context) => BlocProvider<FilteredCasesBloc>(
        create: (context) => FilteredCasesBloc(cases: patients),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(city),
          centerTitle: true,
          bottom: TabBar(
            onTap: (index) {
              switch (index) {
                case 0:
                  context.bloc<FilteredCasesBloc>()
                    ..add(CasesFilteredByRecovery());
                  break;
                case 1:
                  context.bloc<FilteredCasesBloc>()
                    ..add(CasesFilteredByDeath());
                  break;
                case 2:
                  context.bloc<FilteredCasesBloc>()
                    ..add(CasesFilteredByGeneral());
                  break;
              }
            },
            tabs: <Widget>[
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Recovered'),
                    Container(
                      child: Text(
                        context
                            .bloc<FilteredCasesBloc>()
                            .cases
                            .where(
                              (element) => element.removalType
                                  .toLowerCase()
                                  .contains('recovered'),
                            )
                            .length
                            .toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Died'),
                    Container(
                      child: Text(
                        context
                            .bloc<FilteredCasesBloc>()
                            .cases
                            .where(
                              (element) => element.removalType
                                  .toLowerCase()
                                  .contains('died'),
                            )
                            .length
                            .toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('All'),
                    Container(
                      child: Text(
                        context
                            .bloc<FilteredCasesBloc>()
                            .cases
                            .length
                            .toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<FilteredCasesBloc, FilteredCasesState>(
            builder: (context, state) {
          if (state is FilteredCasesLoaded) {
            return Scrollbar(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: state.filteredCases.length,
                itemBuilder: (context, i) {
                  final Patient patient = state.filteredCases[i];
                  return CaseCardWidget(
                    patient: patient,
                  );
                },
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
