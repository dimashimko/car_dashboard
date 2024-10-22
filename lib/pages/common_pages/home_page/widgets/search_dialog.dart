import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../resources/app_colors.dart';

class SearchDialog extends SearchDelegate {
  SearchDialog({
    required this.primaryTextColor,
    required this.searchBackground,
  });

  final Color primaryTextColor;
  final Color searchBackground;

  final List<String> data = [
    'Mini Cooper',
    'Porsche 911 Carrera',
    'Porshe 718 Cayman S',
    'Tesla Model S',
    'Ford Mustang GT',
    'Chevrolet Camaro',
    'Lamborghini Aventador',
    'Ferrari F8 Tributo',
    'Audi R8',
    'BMW M3',
    'Mercedes-AMG GT',
    'Aston Martin Vantage',
    'Jaguar F-Type',
    'Nissan GT-R',
    'Maserati Ghibli',
    'Bugatti Chiron',
    'Pagani Huayra',
    'McLaren 720S',
    'Alfa Romeo Giulia Quadrifoglio',
    'Lotus Evora GT',
    'Rolls-Royce Wraith',
    'Bentley Continental GT'
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = data.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestions[index],
            style: TextStyle(
              color: colors(context).textPrimary,
            ),
          ),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  TextStyle? get searchFieldStyle => TextStyle(
        color: primaryTextColor,
      );

  @override
  String? get searchFieldLabel => 'Search';

  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        filled: true,
        fillColor: searchBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(16.0),
        hintStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppColors.gray.dark4,
        ),
      );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        'You selected: $query',
        style: TextStyle(
          color: colors(context).textPrimary,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.highlight_remove_rounded,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        context.pop();
      },
    );
  }

  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Container(
        color: colors(context).background,
        child: Center(
          child: Text(
            'Quick car search',
            style: TextStyle(
              color: colors(context).textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget? buildFlexibleSpace(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors(context).background,
            colors(context).scaffoldBackgroundColor
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
