import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncov_tracker_ph/ui/hospital_listings_page/bloc/hospital_bloc.dart';

class HospitalListingsSearchBarWidget extends StatefulWidget {
  @override
  _HospitalListingsSearchBarWidgetState createState() =>
      _HospitalListingsSearchBarWidgetState();
}

class _HospitalListingsSearchBarWidgetState
    extends State<HospitalListingsSearchBarWidget> {
  final TextEditingController searchController = TextEditingController();

  onStringChanged() {
    BlocProvider.of<HospitalBloc>(context)
      ..add(HospitalSearched(query: searchController.text.toLowerCase()));
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(onStringChanged);
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search Hospitals',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: (searchController.text.isNotEmpty)
              ? IconButton(
                  icon: Icon(FontAwesomeIcons.timesCircle),
                  onPressed: () => setState(() => searchController.text = ''),
                )
              : null,
        ),
      ),
      noItemsFoundBuilder: (context) => ListTile(
        title: Text('No Hospitals Found!'),
      ),
      onSuggestionSelected: (suggestion) => searchController.text = suggestion,
      suggestionsCallback: (string) {
        final tempHospitalSuggesions = BlocProvider.of<HospitalBloc>(context)
            .hospitals
            .map((e) => e.name)
            .toList();
        tempHospitalSuggesions.retainWhere(
            (element) => element.toLowerCase().contains(string.toLowerCase()));
        return tempHospitalSuggesions;
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
    );
  }
}
