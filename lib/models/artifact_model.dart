import 'dart:math';

class Artifact {
  final String name;
  final String imageUrl;
  final double rating;
  final String description;
  final double price;
  final int reviews;
  final int? discount;

  Artifact({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.price,
    required this.reviews,
    this.discount,
  });
}

List<Artifact> onBoardingArtifacts = [
  zevkCatalog[2],
  anatolianCatalog[0],
  ottomanCollection[1]
];

List<Artifact> ottomanCollection = [
  Artifact(
      name: 'Thank God Bowl',
      imageUrl: 'assets/images/ThankGodBowl.png',
      rating: 3.2,
      description:
          'When it comes to Ottoman cuisine, the art of food, food culture, table richness and variety of food come to mind. From the time of Fatih, when Topkapı Palace was built, meals were cooked in kitchens called Matbah-ı Amire.',
      price: 1750,
      reviews: 325),
  Artifact(
      name: 'Hockey Sugar',
      imageUrl: 'assets/images/HockeySugar.png',
      rating: 5,
      description:
          'Pen, paper and ink are the basic tools of calligraphy and the selection, use and preparation of each are in different forms. ',
      price: 1595,
      reviews: 325,
      discount: 25),
  Artifact(
      name: 'Rumili Kase',
      imageUrl: 'assets/images/Rumili_Kase.png',
      rating: 4.2,
      description:
          'The Rumili Bowl was inspired by the 15th century copper oil lamp exhibited in the Turkish Islamic Arts',
      price: 2350,
      reviews: 3254),
];

List<Artifact> anatolianCatalog = [
  Artifact(
      name: 'Hagia Sophia Deesis Mosaic Vase',
      imageUrl: 'assets/images/SoteriaVazo.png',
      rating: 4.6,
      description:
          'The Virgin Mary in the “Deesis” scene in the south gallery of Hagia Sophia is depicted on the Hagia Sophia Mosaic Vase.',
      price: 3450,
      reviews: 2357),
  Artifact(
      name: 'Soteria Vase',
      imageUrl: 'assets/images/SoteriaVase.png',
      rating: 4.2,
      description:
          'A floor mosaic dating back to the 5th century AD is depicted on the Soteria Vase, found in Antakya and exhibited at the Archaeological Museum of Antakya. ',
      price: 2950,
      reviews: 894),
  Artifact(
      name: 'Kavuk Vase',
      imageUrl: 'assets/images/KavukVase.png',
      rating: 3.9,
      description:
          'Kavuk Vase is decorated with inspiration from the patterns of a tile cube from 1500-1600 in Kütahya Museum. Rumi patterns on Kavuk Vase were interpreted using enamel technique.',
      price: 4250,
      reviews: 985)
];

// ignore: non_constant_identifier_names
List<Artifact> zevkCatalog = [
  Artifact(
      name: 'Mystical Vase',
      imageUrl: 'assets/images/MysticalVase.png',
      rating: 4.5,
      description:
          'Iznik tile, which is considered to be worthy of the crown ceremony , which is based on the love of the earth with fire , has been used in every field including Iznik tile art, architecture and kitchen, and has become an interest of the whole world by turning into a symbol of spiritual aesthetics and pleasure-i selim .',
      price: 3150,
      reviews: 1521),
  Artifact(
      name: 'Medicinal Vase',
      imageUrl: 'assets/images/MedicinalVase.png',
      rating: 4.4,
      description:
          'Your eternity, the life after death a symbol of hope, faith and endurance, eternity; the most favored of the trees of life / trees of life. Cypress is a beautiful cypress, cypress inspired by the talismanic shirts of beliefs in the palace and prayers against evil eye. It has been honored for centuries and the most traditional and modern conventions for centuries,',
      price: 4850,
      reviews: 652),
  Artifact(
      name: 'Gulcehre Ibrik',
      imageUrl: 'assets/images/Gulcehre_ibrik.png',
      rating: 5,
      description:
          'Pitchers; They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.',
      price: 5650,
      reviews: 2359)
];

List<Artifact> artifacts = [
  ...ottomanCollection,
  ...zevkCatalog,
  ...anatolianCatalog
];

// void main() {
//   List<Artifact> artifactss = getRandomItems(artifacts);
//   print(artifactss.length);
// }

List<Artifact> getRandomItems(List<Artifact> list) {
  var rand = new Random();
  List<Artifact> randomArtifact = [];
  for (int i = 0; i < 3; i++) {
    int i = rand.nextInt(list.length);
    Artifact randomString = list[i];
    randomArtifact.add(randomString);
  }
  return randomArtifact;
}

class Specification {
  final String specificationName;
  final String specificationValue;

  Specification(
      {required this.specificationName, required this.specificationValue});
}

List<Specification> specifications = [
  Specification(
    specificationName: 'Case diameter',
    specificationValue: 'Diameter: 20 cm Length: 40 cm',
  ),
  Specification(
    specificationName: 'Product Origin ',
    specificationValue: 'Turkey',
  ),
  Specification(
    specificationName: 'Production method',
    specificationValue: '100% handmade.',
  ),
  Specification(
    specificationName: 'Material',
    specificationValue: 'Gold and Glass crafting',
  ),
  Specification(
    specificationName: 'Strap color',
    specificationValue: 'Gold Color',
  ),
];

class Review {
  final String imgUrl;
  final String name;
  final String date;
  final String review;

  Review(
      {required this.imgUrl,
      required this.name,
      required this.date,
      required this.review});
}

List<Review> reviews = [
  Review(
    imgUrl: 'assets/images/no_image.png',
    name: 'Victor Flexin',
    date: '23 September 2019',
    review:
        'The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.',
  ),
  Review(
    imgUrl: 'assets/images/no_image.png',
    name: 'Mike Flexin',
    date: '27 November 2019',
    review:
        'The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.',
  ),
];
