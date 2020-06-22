import 'package:CreditCard/controllers/offset_controller.dart';
import 'package:CreditCard/controllers/page_controller.dart';
import 'package:CreditCard/widgets/my_app_bar.dart';
import 'package:CreditCard/widgets/panel_top.dart';
import 'package:CreditCard/widgets/item_page.dart';
import 'package:CreditCard/widgets/panel_top_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            MyAppBar(),
            Consumer<PageControllerApp>(
                builder: (context, notifier, child) {
                  return AnimatedPadding(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.only(
                      top: notifier.currentIndex != -1 ? 0 : 20,
                    ),
                    child: AnimatedOpacity(
                      opacity: notifier.currentIndex != -1 ? 1 : 0,
                      child: child,
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                },
                child: PanelTopTwo()),
            Consumer<PageControllerApp>(
                builder: (context, notifier, child) {
                  return AnimatedOpacity(
                    child: child,
                    opacity: notifier.currentIndex != -1 ? 0 : 1,
                    duration: Duration(milliseconds: 300),
                  );
                },
                child: PanelTop()),
            Consumer<PageControllerApp>(
              builder: (context, notifier, child) => Container(
                margin: EdgeInsets.only(top: 60),
                height: MediaQuery.of(context).size.height - 60,
                child: PageView(
                  physics:
                      Provider.of<PageControllerApp>(context, listen: false)
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
                      operadoraURL: 'https://carnesparaguassu.com.br/wp-content/uploads/2017/12/logo-diners-club-novo-1.png',
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
          ],
        ),
      ),
    );
  }
}
