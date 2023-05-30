import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projet_test/recipe.dart';
import 'package:projet_test/recipeScreen.dart';

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
        "Pizza Chorizo",
        "Par Lény Metzger",
        "https://img.cuisineaz.com/660x660/2016/05/13/i71494-pizza-au-chorizo-poivron-et-tomate-a-ma-facon.webp",
        "1 - Préchauffez le four à th.7-8 (220°C).\n2 - Pelez et émincez l’oignon. Lavez le poivron et la tomate, puis épépinez-les et découpez-les en menus morceaux.\n3 - Dans une casserole huilée, faites suer l’oignon avec le poivron et la tomate 5 min. Retirez du feu, ajoutez le basilic et 1 c. à soupe de sucre. Mélangez, puis répartissez sur la pâte à pizza préalablement déroulée.\n4 - Salez, poivrez et répartissez les tranches de chorizo.\n5 - Saupoudrez de cheddar et enfournez pour 20 min.",
        false,
        68),
    Recipe(
        "Pizza Chorizo 2",
        "Par Lény Metzger",
        "https://img.cuisineaz.com/660x660/2016/05/13/i71494-pizza-au-chorizo-poivron-et-tomate-a-ma-facon.webp",
        "1 - Préchauffez le four à th.7-8 (220°C).\n2 - Pelez et émincez l’oignon. Lavez le poivron et la tomate, puis épépinez-les et découpez-les en menus morceaux.\n3 - Dans une casserole huilée, faites suer l’oignon avec le poivron et la tomate 5 min. Retirez du feu, ajoutez le basilic et 1 c. à soupe de sucre. Mélangez, puis répartissez sur la pâte à pizza préalablement déroulée.\n4 - Salez, poivrez et répartissez les tranches de chorizo.\n5 - Saupoudrez de cheddar et enfournez pour 20 min.",
        false,
        68),
    Recipe(
        "Pizza Chorizo 3",
        "Par Lény Metzger",
        "https://img.cuisineaz.com/660x660/2016/05/13/i71494-pizza-au-chorizo-poivron-et-tomate-a-ma-facon.webp",
        "1 - Préchauffez le four à th.7-8 (220°C).\n2 - Pelez et émincez l’oignon. Lavez le poivron et la tomate, puis épépinez-les et découpez-les en menus morceaux.\n3 - Dans une casserole huilée, faites suer l’oignon avec le poivron et la tomate 5 min. Retirez du feu, ajoutez le basilic et 1 c. à soupe de sucre. Mélangez, puis répartissez sur la pâte à pizza préalablement déroulée.\n4 - Salez, poivrez et répartissez les tranches de chorizo.\n5 - Saupoudrez de cheddar et enfournez pour 20 min.",
        false,
        68)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.red, title: Text("Mes recettes")),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return RecipeItemWidget(recipe: recipes[index]);
          },
          itemCount: recipes.length,
        ));
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/recipe', arguments: recipe);
        },
        child: Card(
            margin: EdgeInsets.all(8),
            elevation: 8,
            child: Row(children: [
              Hero(
                tag: "imageRecipe" + recipe.title,
                child: CachedNetworkImage(
                    imageUrl: recipe.imageUrl,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          recipe.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Text(recipe.user,
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 16))
                    ],
                  ))
            ])));
  }
}
