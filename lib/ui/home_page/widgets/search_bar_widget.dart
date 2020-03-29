import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ncov_tracker_ph/ui/home_page/bloc/search_bloc/search_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController searchTextController = TextEditingController();

  onFieldChanged() {
    BlocProvider.of<SearchBloc>(context)
      ..add(
        CitiesSearched(query: searchTextController.text),
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
      child: TextFormField(
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
    );
  }
}
