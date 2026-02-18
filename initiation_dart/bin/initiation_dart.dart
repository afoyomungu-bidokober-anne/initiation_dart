import 'package:initiation_dart/initiation_dart.dart';


void main(List<String> arguments) {
  /*if(arguments.isEmpty){
    print("[USAGE] dart run bin/initiation_dart.dart tempCelcius tempFarenheit");
    return;
  }

  var temperatureCelcius = double.parse(arguments[0]);
 
  print(
    "$temperatureCelcius C = ${conversionCelciusFarenheit(temperatureCelcius)} F");
  */
  // ignore: non_constant_identifier_names
final etudiant1 = Etudiant(matricule: 101,nom: "Dupont", postnom: "Paul");

print("notre premier etudiant c'est: $etudiant1");
}
