class NameModel {
  String english;
  String japanese;
  String chinese;
  String french;

  NameModel(this.english, this.japanese, this.chinese, this.french);

  NameModel.fromJson(Map<String, dynamic> jsonMap) {
    this.english = jsonMap['english'];
    this.japanese = jsonMap['japanese'];
    this.chinese = jsonMap['chinese'];
    this.french = jsonMap['french'];
  }

  Map<String, dynamic> toJson() => {
        'english': this.english,
        'japanese': this.japanese,
        'chinese': this.chinese,
        'french': this.french,
      };
}
