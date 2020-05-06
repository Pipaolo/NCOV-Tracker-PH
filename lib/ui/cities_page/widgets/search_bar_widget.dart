import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncov_tracker_ph/ui/cities_page/bloc/cities_search/cities_search_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key key}) : super(key: key);
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController searchTextController = TextEditingController();
  List<String> suggestions = [];

  onFieldChanged() {
    BlocProvider.of<CitiesSearchBloc>(context)
      ..add(
        CitiesSearched(
          queryName: searchTextController.text,
        ),
      );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    searchTextController.addListener(onFieldChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            hintText: 'Search Cities',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: (searchTextController.text.isEmpty)
                ? null
                : IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.times,
                    ),
                    onPressed: () {
                      setState(() {
                        searchTextController.text = '';
                      });
                    },
                  ),
          ),
          controller: searchTextController,
        ),
        suggestionsCallback: (string) async {
          final tempSuggestions = BlocProvider.of<CitiesSearchBloc>(context)
              .cities
              .map((city) => city.name)
              .toList();
          tempSuggestions.retainWhere(
            (suggestion) => suggestion.toLowerCase().startsWith(
                  string.toLowerCase(),
                ),
          );
          return tempSuggestions;
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (suggestion) {
          BlocProvider.of<CitiesSearchBloc>(context)
            ..add(
              CitiesSearched(queryName: suggestion),
            );
          searchTextController.text = suggestion;
        },
        getImmediateSuggestions: true,
      ),
    );
  }
}
