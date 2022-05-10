import 'package:flutter/material.dart';
import 'package:projeto2/components/place_item.dart';
import 'package:projeto2/data/my_data.dart';
import 'package:projeto2/models/country.dart';

class CountryPlacesScreen extends StatelessWidget {
  //Country country;
  // CountryPlacesScreen(this.country);

  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context)!.settings.arguments as Country;

    final countryPlaces = DUMMY_PLACES.where((places) {
      return places.paises.contains(country.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(country.title),
      ),
      body: ListView.builder(
          itemCount: countryPlaces.length,
          itemBuilder: (ctx, index) {
            return PlaceItem(countryPlaces[index]);
          }),
    );
  }
}