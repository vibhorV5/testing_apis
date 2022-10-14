import 'dart:convert';

import 'package:get/get.dart';
import 'package:testing_apis/Models/cocktail.dart';
import 'package:http/http.dart' as http;

class CocktailController extends GetxController {
  RxList<Cocktail> randomCocktail = <Cocktail>[].obs;
  RxBool cocktailLoaded = false.obs;
  var url = "http://www.thecocktaildb.com/api/json/v1/1/random.php";

  Future<dynamic> loadRandomCocktail() async {
    print('hello');
    cocktailLoaded(false);
    try {
      final response = await http.get(Uri.parse(url), headers: {});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print('model data---> ${jsonData.toString()}');

        //  Map<String, dynamic> decodeData = jsonDecode(response.body.toString());

        final randomCocktailGet = cocktailFromJson(response.body.toString());
        randomCocktail.addAll({randomCocktailGet});
        print('model data---> ${jsonData.toString()}');
        cocktailLoaded.value = true;

        cocktailLoaded(true);
        return randomCocktail;
      } else {
        return randomCocktail;
      }
    } catch (e) {
      print('error = $e');
    }
  }
}
