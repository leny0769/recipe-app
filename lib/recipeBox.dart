import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projet_test/recipe.dart';

class RecipeBox {
  static final RecipeBox instance = RecipeBox();
  static Box? box;

  static void init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(RecipeAdapter());
    box = await Hive.openBox('recipeBox');
    var values = box?.values;
    if (values == null || values.isEmpty) {
      RecipeBox.box?.putAll(
          Map.fromIterable(recipes, key: (e) => e.key(), value: (e) => e));
    }
  }

  static final List<Recipe> recipes = [
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
}
