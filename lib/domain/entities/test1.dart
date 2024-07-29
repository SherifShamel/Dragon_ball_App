// Id : 2
// name : "Vegeta"
// ki : "54.000.000"
// maxKi : "19.84 Septillion"
// race : "Saiyan"
// gender : "Male"
// description : "Príncipe de los Saiyans, inicialmente un villano, pero luego se une a los Z Fighters. A pesar de que a inicios de Dragon Ball Z, Vegeta cumple un papel antagónico, poco después decide rebelarse ante el Imperio de Freeza, volviéndose un aliado clave para los Guerreros Z. Con el paso del tiempo llegaría a cambiar su manera de ser, optando por permanecer y vivir en la Tierra para luchar a su lado contra las inminentes adversidades que superar. Junto con Piccolo, él es de los antiguos enemigos de Goku que ha evolucionando al pasar de ser un villano y antihéroe, a finalmente un héroe a lo largo del transcurso de la historia, convirtiéndose así en el deuteragonista de la serie."
// image : "https://dragonball-api.com/characters/vegeta_normal.webp"
// affiliation : "Z Fighter"
// deletedAt : null
// originPlanet : {"id":3,"name":"Vegeta","isDestroyed":true,"description":"El planeta Vegeta, conocido como planeta Plant antes del fin de la Guerra Saiyan-tsufruiana en el año 730, es un planeta rocoso ficticio de la serie de manga y anime Dragon Ball y localizado en la Vía Láctea de las Galaxias del Norte del Universo 7 hasta su destrucción a manos de Freezer en los años 737-739. Planeta natal de los Saiyans, destruido por Freezer. Anteriormente conocido como Planeta Plant.","image":"https://dragonball-api.com/planetas/Planeta_Vegeta_en_Dragon_Ball_Super_Broly.webp","deletedAt":null}
// transformations : [{"id":7,"name":"Vegeta SSJ","image":"https://dragonball-api.com/transformaciones/vegeta SSJ (2).webp","ki":"330.000.000","deletedAt":null},{"id":8,"name":"Vegeta SSJ2","image":"https://dragonball-api.com/transformaciones/vegeta ssj2.webp","ki":"24 Billion","deletedAt":null},{"id":9,"name":"Vegeta SSJ4","image":"https://dragonball-api.com/transformaciones/vegeta ssj4.webp","ki":"1.8 Trillion","deletedAt":null},{"id":10,"name":"Vegeta SSJB","image":"https://dragonball-api.com/transformaciones/vegeta SSJB.webp","ki":"100 Quintillion","deletedAt":null},{"id":11,"name":"Vegeta Mega Instinc Evil","image":"https://dragonball-api.com/transformaciones/vegeta mega instinto.webp","ki":"19.84 Septillion","deletedAt":null}]

class Test1 {

  int? id;
  String? name;
  String? ki;
  String? maxKi;
  String? race;
  String? gender;
  String? description;
  String? image;
  String? affiliation;
  dynamic deletedAt;
  // OriginPlanet? originPlanet;
  List<Transformations>? transformations;

  Test1({
      this.id, 
      this.name, 
      this.ki, 
      this.maxKi, 
      this.race, 
      this.gender, 
      this.description, 
      this.image, 
      this.affiliation, 
      this.deletedAt, 
      // this.originPlanet,
      this.transformations,});

  Test1.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    ki = json['ki'];
    maxKi = json['maxKi'];
    race = json['race'];
    gender = json['gender'];
    description = json['description'];
    image = json['image'];
    affiliation = json['affiliation'];
    deletedAt = json['deletedAt'];
    // originPlanet = json['originPlanet'] != null ? OriginPlanet.fromJson(json['originPlanet']) : null;
    if (json['transformations'] != null) {
      transformations = [];
      json['transformations'].forEach((v) {
        transformations?.add(Transformations.fromJson(v));
      });
    }
  }

}

/// id : 7
/// name : "Vegeta SSJ"
/// image : "https://dragonball-api.com/transformaciones/vegeta SSJ (2).webp"
/// ki : "330.000.000"
/// deletedAt : null

class Transformations {
  int? id;
  String? name;
  String? image;
  String? ki;
  dynamic deletedAt;

  Transformations({
      this.id, 
      this.name, 
      this.image, 
      this.ki, 
      this.deletedAt,});

  Transformations.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    ki = json['ki'];
    deletedAt = json['deletedAt'];
  }

}

/// id : 3
/// name : "Vegeta"
/// isDestroyed : true
/// description : "El planeta Vegeta, conocido como planeta Plant antes del fin de la Guerra Saiyan-tsufruiana en el año 730, es un planeta rocoso ficticio de la serie de manga y anime Dragon Ball y localizado en la Vía Láctea de las Galaxias del Norte del Universo 7 hasta su destrucción a manos de Freezer en los años 737-739. Planeta natal de los Saiyans, destruido por Freezer. Anteriormente conocido como Planeta Plant."
/// image : "https://dragonball-api.com/planetas/Planeta_Vegeta_en_Dragon_Ball_Super_Broly.webp"
/// deletedAt : null

// class OriginPlanet {
//   OriginPlanet({
//       this.id,
//       this.name,
//       this.isDestroyed,
//       this.description,
//       this.image,
//       this.deletedAt,});
//
//   OriginPlanet.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     isDestroyed = json['isDestroyed'];
//     description = json['description'];
//     image = json['image'];
//     deletedAt = json['deletedAt'];
//   }
//   int? id;
//   String? name;
//   bool? isDestroyed;
//   String? description;
//   String? image;
//   dynamic deletedAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['isDestroyed'] = isDestroyed;
//     map['description'] = description;
//     map['image'] = image;
//     map['deletedAt'] = deletedAt;
//     return map;
//   }
//
// }