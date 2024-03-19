class Film {
  final String? title, image;
  final List<Map>? label;

  Film({this.title, this.image, this.label});
}

List films = [
  Film(title: "Babel", image: "assets/images/babel1.jpeg"),
  Film(title: "Bete-Bete", image: "assets/images/betebete.jpeg"),
  Film(title: "Vautours", image: "assets/images/vautour1.jpeg"),
  Film(title: "Decheance", image: "assets/images/decheance.jpeg"),
  Film(title: "Impact", image: "assets/images/impact.jpeg"),
  Film(title: "Wiri-Wiri", image: "assets/images/impuissance.jpeg"),
  Film(title: "Wiri-Wiri", image: "assets/images/babel1.jpeg"),
  Film(title: "Idole", image: "assets/images/vautour1.jpeg"),
];

final popularfilms = [
  Film(title: "Coeurs brisés", image: "assets/images/babel1.jpeg", label: [
    {
      "name": "Evenprod",
      "lead": "Ibou GUEYE",
      "image": "assets/images/babel1.jpeg",
    },
    {
      "name": "Marodi",
      "lead": "POD",
      "image": "assets/images/babel1.jpeg",
    },
  ])
];
