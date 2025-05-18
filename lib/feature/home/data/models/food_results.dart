import 'package:equatable/equatable.dart';

class FoodResults extends Equatable {
  final num? id;
  final String? image;
  final String? imageType;
  final String? title;
  final num? readyInMinutes;
  final num? servings;
  final String? sourceUrl;
  final bool? vegetarian;
  final bool? vegan;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? veryPopular;
  final bool? sustainable;
  final bool? lowFodmap;
  final num? weightWatcherSmartPoints;
  final String? gaps;
  final dynamic preparationMinutes;
  final dynamic cookingMinutes;
  final num? aggregateLikes;
  final num? healthScore;
  final String? creditsText;
  final String? license;
  final String? sourceName;
  final double? pricePerServing;
  final String? summary;
  final List<dynamic>? cuisines;
  final List<dynamic>? dishTypes;
  final List<dynamic>? diets;
  final List<dynamic>? occasions;
  final double? spoonacularScore;
  final String? spoonacularSourceUrl;

  const FoodResults({
    this.id,
    this.image,
    this.imageType,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
  });

  factory FoodResults.fromJson(Map<String, dynamic> json) => FoodResults(
    id: json['id'] as num?,
    image: json['image'] as String?,
    imageType: json['imageType'] as String?,
    title: json['title'] as String?,
    readyInMinutes: json['readyInMinutes'] as num?,
    servings: json['servings'] as num?,
    sourceUrl: json['sourceUrl'] as String?,
    vegetarian: json['vegetarian'] as bool?,
    vegan: json['vegan'] as bool?,
    glutenFree: json['glutenFree'] as bool?,
    dairyFree: json['dairyFree'] as bool?,
    veryHealthy: json['veryHealthy'] as bool?,
    cheap: json['cheap'] as bool?,
    veryPopular: json['veryPopular'] as bool?,
    sustainable: json['sustainable'] as bool?,
    lowFodmap: json['lowFodmap'] as bool?,
    weightWatcherSmartPoints: json['weightWatcherSmartPoints'] as num?,
    gaps: json['gaps'] as String?,
    preparationMinutes: json['preparationMinutes'] as dynamic,
    cookingMinutes: json['cookingMinutes'] as dynamic,
    aggregateLikes: json['aggregateLikes'] as num?,
    healthScore: json['healthScore'] as num?,
    creditsText: json['creditsText'] as String?,
    license: json['license'] as String?,
    sourceName: json['sourceName'] as String?,
    pricePerServing: (json['pricePerServing'] as num?)?.toDouble(),
    summary: json['summary'] as String?,
    cuisines: json['cuisines'] as List<dynamic>?,
    dishTypes: json['dishTypes'] as List<dynamic>?,
    diets: json['diets'] as List<dynamic>?,
    occasions: json['occasions'] as List<dynamic>?,
    spoonacularScore: (json['spoonacularScore'] as num?)?.toDouble(),
    spoonacularSourceUrl: json['spoonacularSourceUrl'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'imageType': imageType,
    'title': title,
    'readyInMinutes': readyInMinutes,
    'servings': servings,
    'sourceUrl': sourceUrl,
    'vegetarian': vegetarian,
    'vegan': vegan,
    'glutenFree': glutenFree,
    'dairyFree': dairyFree,
    'veryHealthy': veryHealthy,
    'cheap': cheap,
    'veryPopular': veryPopular,
    'sustainable': sustainable,
    'lowFodmap': lowFodmap,
    'weightWatcherSmartPoints': weightWatcherSmartPoints,
    'gaps': gaps,
    'preparationMinutes': preparationMinutes,
    'cookingMinutes': cookingMinutes,
    'aggregateLikes': aggregateLikes,
    'healthScore': healthScore,
    'creditsText': creditsText,
    'license': license,
    'sourceName': sourceName,
    'pricePerServing': pricePerServing,
    'summary': summary,
    'cuisines': cuisines,
    'dishTypes': dishTypes,
    'diets': diets,
    'occasions': occasions,
    'spoonacularScore': spoonacularScore,
    'spoonacularSourceUrl': spoonacularSourceUrl,
  };

  @override
  List<Object?> get props {
    return [
      id,
      image,
      imageType,
      title,
      readyInMinutes,
      servings,
      sourceUrl,
      vegetarian,
      vegan,
      glutenFree,
      dairyFree,
      veryHealthy,
      cheap,
      veryPopular,
      sustainable,
      lowFodmap,
      weightWatcherSmartPoints,
      gaps,
      preparationMinutes,
      cookingMinutes,
      aggregateLikes,
      healthScore,
      creditsText,
      license,
      sourceName,
      pricePerServing,
      summary,
      cuisines,
      dishTypes,
      diets,
      occasions,
      spoonacularScore,
      spoonacularSourceUrl,
    ];
  }
}
