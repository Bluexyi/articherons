import 'dart:math';

class Info{
  String adherent;
  String client;
  String referent;
  String usage;
  String essence;
  int lgBillon;
  int diametre;

  double getVolume(int nb_billon){
    return (3.14 * pow((diametre/2),2) * lgBillon * nb_billon ) / 1000000;
  }


}