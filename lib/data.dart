class Film {
  final String? title, image;
  final List<Map>? label;

  Film({this.title, this.image, this.label});
}

List films = [
  Film(title: "Vautours", image: "assets/images/vautour.jpeg"),
  Film(title: "Idole", image: "assets/images/idole.jpeg"),
  Film(title: "Decheance", image: "assets/images/decheance.jpeg"),
  Film(title: "Impact", image: "assets/images/impact.jpeg"),
  Film(title: "Bete-Bete", image: "assets/images/betebete.jpeg"),
  Film(title: "Babel", image: "assets/images/babel.jpeg"),
];

List prodHouses = [
  Film(
    title: "Evenprod",
    image: "assets/images/vautour.jpeg",
  ),
  Film(
    image: "assets/images/babel.jpeg",
  ),
];

final popularfilms = [
  Film(title: "Coeurs brisés", image: "assets/images/babel.jpeg", label: [
    {
      "name": "Evenprod",
      "lead": "Ibou GUEYE",
      "image": "assets/images/babel.jpeg",
    },
    {
      "name": "Marodi",
      "lead": "POD",
      "image": "assets/images/babel.jpeg",
    },
  ])
];
List foryoulist = [
  Film(title: "Most watches"),
  Film(title: "Recently Add"),
  Film(title: "Best Rated"),
];
