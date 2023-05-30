import 'package:flutter/material.dart';
import 'package:projet_test/favoriteChangeNotifier.dart';
import 'package:projet_test/favoriteWidget.dart';
import 'package:projet_test/recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              Text(recipe.user,
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
        ),
        FavoriteIconWidget(),
        FavoriteTextWidget()
      ]),
    );

    Widget buttonSection = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomColum(Colors.blue, Icons.comment, "COMMENT"),
          _buildBottomColum(Colors.blue, Icons.share, "SHARE")
        ],
      ),
    );

    Widget recetteSection = Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );

    return ChangeNotifierProvider(
        create: (context) =>
            FavoriteChangeNotifier(recipe.isFavorited, recipe.favoriteCount),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("Mes recettes"),
          ),
          body: ListView(children: [
            Stack(
              children: [
                Container(
                  width: 600,
                  height: 240,
                  child: Center(child: CircularProgressIndicator()),
                ),
                Hero(
                    tag: "imageRecipe" + recipe.title,
                    child: CachedNetworkImage(
                        imageUrl: recipe.imageUrl,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: 600,
                        height: 240,
                        fit: BoxFit.cover))
              ],
            ),
            titleSection,
            buttonSection,
            recetteSection
          ]),
        ));
  }

  Column _buildBottomColum(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(icon, color: color)),
        Text(label,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: color))
      ],
    );
  }
}
