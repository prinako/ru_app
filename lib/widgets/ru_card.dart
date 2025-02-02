import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class RuCard extends StatelessWidget {
  final String refeicao;
  final String nomeDaRefi;
  final String? vegetariano;
  final String? comida1;
  final String? comida2;
  final String? comida3;
  final String? comida4;
  final String? comida5;

  const RuCard({
    super.key,
    required this.refeicao,
    required this.nomeDaRefi,
    this.vegetariano = '',
    this.comida1 = '',
    this.comida2 = '',
    this.comida3 = '',
    this.comida4 = '',
    this.comida5 = '',
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      refeicao: refeicao,
      nomeDaRefi: nomeDaRefi,
      vegetariano: vegetariano,
      comida1: comida1,
      comida2: comida2,
      comida3: comida3,
      comida4: comida4,
      comida5: comida5,
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.refeicao,
    required this.nomeDaRefi,
    required this.vegetariano,
    required this.comida1,
    required this.comida2,
    required this.comida3,
    required this.comida4,
    required this.comida5,
  });

  final String refeicao;
  final String nomeDaRefi;
  final String? vegetariano;
  final String? comida1;
  final String? comida2;
  final String? comida3;
  final String? comida4;
  final String? comida5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 5,
          color: refeicao == 'ALMOÇO' ? kAlmocoColor : kJantarColor,
          shadowColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
            child: Column(
              children: <Widget>[
                Text(
                  refeicao,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  nomeDaRefi,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Vegetariano:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Flexible(
                        child: Text(
                          '$vegetariano',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comida1 ?? '',
                        style: kTextStyle,
                      ),
                      Text(
                        comida2 ?? '',
                        style: kTextStyle,
                      ),
                      Text(
                        comida3 ?? '',
                        style: kTextStyle,
                      ),
                      Text(
                        comida4 ?? '',
                        style: kTextStyle,
                      ),
                      Text(
                        comida5 ?? '',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
