// Model Dart
class Recipe {
  final int? recipeId; //  ? = nullsafty autoincrement라서 ㅇㅇ 값안주고 자동생성이니까 ㅇㅇ
  final String recipeContent;
  final String recipeName;

  // Constructor
  Recipe(
      {this.recipeId, required this.recipeName, required this.recipeContent});

// dart에서는 중복이름이 안되기 때문에 생성자를 만들어서 쓴다.
  Recipe.formMap(Map<String, dynamic> res)
      : recipeId = res['recipeId'],
        recipeName = res['recipeName'],
        recipeContent = res['recipeContent'];

  Map<String, Object?> toMap() {
    return {
      'recipeId': recipeId,
      'recipeName': recipeName,
      'recipeContent': recipeContent
    };
  }
}
