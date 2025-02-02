import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_no_cardapio.dart';
import 'package:ru_app/widgets/main_list_view.dart';
import 'package:ru_app/widgets/today_is_sexta.dart';
import 'package:ru_app/news/news_carousel_slider.dart';

class RuListView extends StatelessWidget {
  const RuListView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool weekEnd = context.watch<Data>().isWeekEnd;
    final bool isNotWeekEnd = context.watch<Data>().isNotWeekEnd;
    final bool noUpdate = context.watch<Data>().noUpdate;
    final bool isSexta = context.watch<Data>().isSexta;
    final List<dynamic> cardapioDeHoje = context.watch<Data>().cardapioDeHoje;
    final listOfNewsAndImages = context.read<Data>().listOfNews;
    bool isNews = listOfNewsAndImages.isNotEmpty;
    // print(cardapioDeHoje.length);

    return RefreshIndicator(
      color: kNavbarBackgroundColor,
      onRefresh: () async {
        await context.read<Data>().getCardapio();
      },
      child: isNotWeekEnd && cardapioDeHoje.isNotEmpty
          ? const MainListView()
          // se for Sexta feira
          : isSexta
              ? const ToDayIsSexta()
              : noUpdate
                  //esparando por atualização do cardapio
                  ? Column(
                      children: <Widget>[
                        isNews
                            ? const NewsCarouselSlider()
                            : const SizedBox.shrink(),
                        const Expanded(
                          child: NoCardapio(
                            msg: 'Aguardando atualização do cardápio...',
                            color: kWeekEndColor,
                          ),
                        ),
                      ],
                    )

                  // fins de semanas
                  : weekEnd
                      ? Column(
                          children: <Widget>[
                            isNews
                                ? const NewsCarouselSlider()
                                : const SizedBox.shrink(),
                            const Expanded(
                              child: NoCardapio(
                                msg: 'Sem funcionamento aos fins de semana',
                                color: kWeekEndColor,
                              ),
                            ),
                          ],
                        )

                      // não deveria chegar até aqui se for, aconteceu algo.
                      : ListView(),
    );
  }
}
