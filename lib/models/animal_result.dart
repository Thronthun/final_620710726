class animalResult {
  final String image_url;
  final int? answer;
  final dynamic choices_list;

  animalResult({
    required this.image_url,
    required this.answer,
    required this.choices_list
  });

  factory animalResult.fromJson(Map<String, dynamic> json) {
    return animalResult(
      image_url: json["image_url"],
      answer:  json["answer"],
      choices_list:  List<String>.from(json["choices_list"]),
    );
  }
}