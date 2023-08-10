//=========== Uncomment below code to use Unsplash API ===========

class Photos {
}

class Src {
  Src({
    required this.original,
    required this.portrait,
  });

  String original;
  String portrait;

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        portrait: json["portrait"],
      );
}

// =========== Comment when using Unsplash API ===========
// class Images {
//   Images({
//     required this.imageUrl,
//     required this.date,
//     required this.ratio,
//   });
//
//   String imageUrl;
//   String date;
//   double ratio;
//
//   factory Images.fromJson(Map<String, dynamic> json) => Images(
//       imageUrl: json["imageUrl"],
//       date: json["date"],
//       ratio: json["ratio"].toDouble());
// }
