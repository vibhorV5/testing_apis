import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_apis/Screens/Cocktails/Controller/cocktail_controller.dart';
import 'package:testing_apis/Screens/Cocktails/View/cocktails_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cocktailController = Get.put(CocktailController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: double.infinity,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  cocktailController.loadRandomCocktail();
                  Get.to(const CocktailsScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.pink,
                  child: Text('Cocktails Screen'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
