import 'dart:io';
import 'dart:math';

import 'package:ansicolor/ansicolor.dart';
import 'package:demineur/demineur.dart';

void main(List<String> arguments) {
  var execution = true;
  String? choixUtilisateur;
  int largeurGrille = 8;
  int hauteurGrille = 8;
  int tailleGrille = largeurGrille * hauteurGrille;
  int nombreMines = 5;

  final penVert = AnsiPen()..green();
  final penBleu = AnsiPen()..blue();
  final penRouge = AnsiPen()..red();

  var grille = genererGrille(largeurGrille, hauteurGrille, nombreMines);
  var cellulesActives = List<bool>.generate(tailleGrille, (i) => false);

  while (execution) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("-=-=-=-=-=-=-=-=-=-=-");
    print("-      DEMINEUR     -");
    print("-=-=-=-=-=-=-=-=-=-=-");

    if (choixUtilisateur != null) {
      print("dernier coup: ${penVert(choixUtilisateur)}");
    }

    afficherGrille(
      largeurGrille,
      hauteurGrille,
      grille,
      cellulesActives,
      penVert,
      penBleu,
      penRouge,
    );

    stdout.write(penVert("Saisissez votre coup (cl) ou q pour quitter: "));
    choixUtilisateur = stdin.readLineSync();
    choixUtilisateur = choixUtilisateur?.toLowerCase();

    if (choixUtilisateur == null) {
      print("erreur");
      continue;
    }

    if (choixUtilisateur == "q") {
      execution = false;
      continue;
    }

    if (choixUtilisateur.length < 2) {
      stdout.writeln("[Erreur]: choix invalide");
      continue;
    }

    var col = choixUtilisateur.codeUnitAt(0) - 97;

    var ligne = int.tryParse(choixUtilisateur[1].toString());
    if (ligne == null) {
      stdout.writeln("[Erreur]: choix invalide");
      continue;
    }

    ligne = ligne - 1;

    if (col < 0 || col >= largeurGrille) {
      stdout.writeln("[Erreur]: choix invalide");
      continue;
    }

    if (ligne < 0 || ligne >= hauteurGrille) {
      stdout.writeln("[Erreur]: choix invalide");
      continue;
    }

    var index = ligne * largeurGrille + col;

    if (index < 0 || index >= tailleGrille) {
      stdout.writeln("[Erreur]: choix invalide");
      continue;
    }

    activerCellules(
      index,
      largeurGrille,
      hauteurGrille,
      grille,
      cellulesActives,
    );
  }
}