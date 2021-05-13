class BaseModel {
  int hp;
  int attack;
  int defense;
  int spAttack;
  int spDefense;
  int speed;

  BaseModel(this.hp, this.attack, this.defense, this.spAttack, this.spDefense,
      this.speed);

  BaseModel.fromJson(Map<String, dynamic> jsonMap) {
    this.hp = jsonMap['HP'];
    this.attack = jsonMap['Attack'];
    this.defense = jsonMap['Defense'];
    this.spAttack = jsonMap['Sp. Attack'];
    this.spDefense = jsonMap['Sp. Defense'];
    this.speed = jsonMap['Speed'];
  }

  Map<String, dynamic> toJson() => {
        'HP': this.hp,
        'Attack': this.attack,
        'Defense': this.defense,
        'Sp. Attack': this.spAttack,
        'Sp. Defense': this.spDefense,
        'Speed': this.speed,
      };
}
