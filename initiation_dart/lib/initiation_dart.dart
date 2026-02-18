import 'dart:math' as math;

class Etudiant {
  final int matricule;
  final String nom;
  final String postnom;

  Etudiant({this.matricule = 0, this.nom = "", this.postnom = ""});

  @override
  String toString() => "{matricule:$matricule, nom:$nom, postnom: $postnom}";
}
double conversionCelciusFarenheit(double temperatureCelcius) {
  return (temperatureCelcius * 9 / 5) +32;
}

var conversionCelciusFar = (double tempCelcius) => (tempCelcius * 9 / 5) + 32;


double calculvaleurFinale({
  double tauxInternet = 0,
  double annuite = 1,
  double valeurInitiale = 1,
  }) {
    return valeurInitiale * math.pow(1 + tauxInternet ,annuite);
  }
