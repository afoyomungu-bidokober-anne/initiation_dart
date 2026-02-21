import 'dart:io';
import 'dart:math';

String arabeRomain(int nombre) {
  List<int> valeurs = [
    1000, 900, 500, 400,
    100, 90, 50, 40,
    10, 9, 5, 4, 1
  ];

  List<String> symboles = [
    "M", "CM", "D", "CD",
    "C", "XC", "L", "XL",
    "X", "IX", "V", "IV", "I"
  ];

  String resultat = "";

  for (int i = 0; i < valeurs.length; i++) {
    while (nombre >= valeurs[i]) {
      resultat += symboles[i];
      nombre -= valeurs[i];
    }
  }

  return resultat;
}

int romainArabe(String romain) {
  Map<String, int> valeurs = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
  };

  int total = 0;

  for (int i = 0; i < romain.length; i++) {
    int valeurActuelle = valeurs[romain[i]]!;

    if (i + 1 < romain.length) {
      int valeurSuivante = valeurs[romain[i + 1]]!;
      if (valeurActuelle < valeurSuivante) {
        total -= valeurActuelle;
      } else {
        total += valeurActuelle;
      }
    } else {
      total += valeurActuelle;
    }
  }

  return total;
}

void main() {
  int nombre = 1994;

  String romain = arabeRomain(nombre);
  print("Nombre arabe : $nombre");
  print("Nombre romain : $romain");

  int resultat = romainArabe(romain);
  print("Retour en arabe : $resultat");

  print("58 en romain = ${arabeRomain(58)}");
  print("XLII en arabe = ${romainArabe("XLII")}");
}