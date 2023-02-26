class SpecialOfferModel {
  final String name, imagePath;
  final int number;

  SpecialOfferModel({
    required this.name,
    required this.imagePath,
    required this.number,
    
  });
}
// NO ITEMS
List<SpecialOfferModel> specialOffersList = [
  SpecialOfferModel(
    name: "Smartphone",
    imagePath: "assets/images/Image Banner 2.png",
    number: 18,
  ),
  SpecialOfferModel(
    name: "Fashion",
    imagePath: "assets/images/Image Banner 3.png",
    number: 24,
  ),
];
