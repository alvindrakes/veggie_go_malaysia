import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/datamodels/country.dart';

class HomeViewModel extends BaseViewModel {
  Country selectedCountry = Country.country[0];

  void changeCountry(value) {
    selectedCountry = value;
    notifyListeners();
    // print(value.countryName); //Uncomment to see value in terminal
    
    // TODO: Create additional Function to Use Value and Change the Operation.
  }
}
