import 'package:CreditCard/controllers/page_controller.dart';
import 'package:CreditCard/widgets/item_list.dart';
import 'package:CreditCard/widgets/my_app_bar.dart';
import 'package:CreditCard/widgets/panel_top.dart';
import 'package:CreditCard/widgets/item_page.dart';
import 'package:CreditCard/widgets/panel_top_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  @override
  void initState() {
    super.initState();
    Provider.of<PageControllerApp>(context, listen: false).hideSheet();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PageControllerApp>(context, listen: false).hideSheet();
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(),
          PanelTopTwo(),
          PanelTop(),
          Consumer<PageControllerApp>(
            builder: (context, notifier, child) => Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * 0.12 -
                  MediaQuery.of(context).padding.top,
              child: PageView(
                physics: Provider.of<PageControllerApp>(context, listen: false)
                            .currentIndex !=
                        -1
                    ? NeverScrollableScrollPhysics()
                    : ClampingScrollPhysics(),
                onPageChanged: (index) {
                  Provider.of<PageControllerApp>(context, listen: false)
                      .setPageIndex(index);
                },
                controller: _pageController,
                children: <Widget>[
                  ItemPage(
                    index: 0,
                    color: Colors.pink,
                    imageURL:
                        'https://us.123rf.com/450wm/grebeshkovmaxim/grebeshkovmaxim1805/grebeshkovmaxim180500202/100769321-colorful-smooth-gradient-color-background-design-for-your-project-design-.jpg?ver=6',
                    operadoraURL:
                        'https://logodownload.org/wp-content/uploads/2016/10/visa-logo.png',
                  ),
                  ItemPage(
                    index: 1,
                    color: Colors.lightBlue,
                    imageURL:
                        'https://ak5.picdn.net/shutterstock/videos/1018020805/thumb/1.jpg',
                    operadoraURL:
                        'https://carnesparaguassu.com.br/wp-content/uploads/2017/12/logo-diners-club-novo-1.png',
                  ),
                  ItemPage(
                    index: 2,
                    color: Colors.grey[800],
                    imageURL:
                        'https://i.pinimg.com/736x/5c/ee/af/5ceeafdc811d2269821fb03df29374ff.jpg',
                    operadoraURL:
                        'https://1000marcas.net/wp-content/uploads/2019/12/MasterCard-Logo.png',
                  )
                ],
              ),
            ),
          ),
          Consumer<PageControllerApp>(
            builder: (context, value, child) {
              bool isHide =
                  Provider.of<PageControllerApp>(context, listen: false).isHide;
              return AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: isHide ? 0 : 1,
                child: SlidingSheet(
                  elevation: 4,
                  cornerRadius: 16,
                  listener: (state) {
                    Provider.of<PageControllerApp>(context, listen: false)
                        .setState(state);
                    Provider.of<PageControllerApp>(context, listen: false)
                        .setProgress(state.progress);
                  },
                  color: ThemeData.dark().primaryColor,
                  controller:
                      Provider.of<PageControllerApp>(context, listen: false)
                          .sheetController,
                  snapSpec: SnapSpec(
                    snap: true,
                    snappings: [0.2, 0.6, 0.90],
                    positioning: SnapPositioning.relativeToAvailableSpace,
                  ),
                  builder: (context, state) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height * 0.12,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  "Hoje",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                ItemList(
                                  title: 'Sapatos',
                                  subTitle: 'Amazon',
                                  color: Colors.red,
                                  icon: Icon(Icons.shopping_basket),
                                  value: '+\$ 150,00',
                                ),
                                ItemList(
                                  title: 'Carro',
                                  subTitle: 'BMW',
                                  color: Colors.blue,
                                  icon: Icon(Icons.directions_car),
                                  value: '+\$ 100.000,00',
                                ),
                                ItemList(
                                  title: 'Casa',
                                  subTitle: 'RE/MAX',
                                  color: Colors.orange,
                                  icon: Icon(Icons.home),
                                  value: '+\$ 450.000,00',
                                ),
                                ItemList(
                                  title: 'Bicicleta',
                                  subTitle: 'Bicicletaria',
                                  color: Colors.amber,
                                  icon: Icon(Icons.directions_bike),
                                  value: '+\$ 1.200,00',
                                ),
                                ItemList(
                                  title: 'Sapatos',
                                  subTitle: 'Amazon',
                                  color: Colors.red,
                                  icon: Icon(Icons.shopping_basket),
                                  value: '+\$ 150,00',
                                ),
                                ItemList(
                                  title: 'Carro',
                                  subTitle: 'BMW',
                                  color: Colors.blue,
                                  icon: Icon(Icons.directions_car),
                                  value: '+\$ 100.000,00',
                                ),
                                ItemList(
                                  title: 'Casa',
                                  subTitle: 'RE/MAX',
                                  color: Colors.orange,
                                  icon: Icon(Icons.home),
                                  value: '+\$ 450.000,00',
                                ),
                                ItemList(
                                  title: 'Bicicleta',
                                  subTitle: 'Bicicletaria',
                                  color: Colors.amber,
                                  icon: Icon(Icons.directions_bike),
                                  value: '+\$ 1.200,00',
                                ),
                                ItemList(
                                  title: 'Sapatos',
                                  subTitle: 'Amazon',
                                  color: Colors.red,
                                  icon: Icon(Icons.shopping_basket),
                                  value: '+\$ 150,00',
                                ),
                                ItemList(
                                  title: 'Carro',
                                  subTitle: 'BMW',
                                  color: Colors.blue,
                                  icon: Icon(Icons.directions_car),
                                  value: '+\$ 100.000,00',
                                ),
                                ItemList(
                                  title: 'Casa',
                                  subTitle: 'RE/MAX',
                                  color: Colors.orange,
                                  icon: Icon(Icons.home),
                                  value: '+\$ 450.000,00',
                                ),
                                ItemList(
                                  title: 'Bicicleta',
                                  subTitle: 'Bicicletaria',
                                  color: Colors.amber,
                                  icon: Icon(Icons.directions_bike),
                                  value: '+\$ 1.200,00',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
