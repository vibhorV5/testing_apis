import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_apis/Screens/Cocktails/Controller/cocktail_controller.dart';

class CocktailsScreen extends StatefulWidget {
  const CocktailsScreen({super.key});

  @override
  State<CocktailsScreen> createState() => _CocktailsScreenState();
}

class _CocktailsScreenState extends State<CocktailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cocktail Screen'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: double.infinity,
          child: Column(
            children: [
              Obx(() {
                return Container(
                  height: 700,
                  width: double.infinity,
                  color: Colors.yellow,
                  child: Get.find<CocktailController>().cocktailLoaded.isTrue
                      ? Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                  Get.find<CocktailController>()
                                      .randomCocktail[0]
                                      .drinks!
                                      .first
                                      .strDrinkThumb
                                      .toString()),
                            ),
                            Text(Get.find<CocktailController>()
                                .randomCocktail[0]
                                .drinks!
                                .first
                                .strCategory
                                .toString()),
                            Text(Get.find<CocktailController>()
                                .randomCocktail[0]
                                .drinks!
                                .first
                                .strInstructions
                                .toString()),
                            Text(Get.find<CocktailController>()
                                .randomCocktail[0]
                                .drinks!
                                .first
                                .strInstructions
                                .toString()),
                          ],
                        )
                      : CircularProgressIndicator(
                          color: Colors.black,
                        ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
