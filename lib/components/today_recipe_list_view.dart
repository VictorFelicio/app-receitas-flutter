import 'package:flutter/material.dart';
// 1
import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
// 2
  final List<ExploreRecipe> recipes;
  const TodayRecipeListView({
    super.key,
    required this.recipes,
  });
  @override
  Widget build(BuildContext context) {
// 3
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
//4
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //5
          Text('Receitas do Dia', style: Theme.of(context).textTheme.headline1),
//6
          const SizedBox(height: 16),
//7
          Container(
            height: 400,
// TODO: Adicione ListView aqui.
            // 1
            color: Colors.transparent,
//2
            child: ListView.separated(
// 3
              scrollDirection: Axis.horizontal,
//4
              itemCount: recipes.length,
              itemBuilder: (context, index) {
//6
                final recipe = recipes[index];

                return buildCard(recipe);
              },
              separatorBuilder: (context, index) {
// 8
                return const SizedBox(width: 16);
              },
            ),
          ),
        ],
      ),
    );
  }

// TODO: Adicione o widget buildCard() aqui.
  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('Este Cartão não Existe Ainda');
    }
  }
}
