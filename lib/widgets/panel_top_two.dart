import 'package:CreditCard/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelTopTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControllerApp>(
      builder: (context, notifier, child) {
        double spec =
            Provider.of<PageControllerApp>(context, listen: false).spec;
        return AnimatedOpacity(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInCubic,
          opacity: notifier.currentIndex == -1 || spec >= 0.6 ? 0 : 1,
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Cartão Completo",
                      style: TextStyle(
                          fontSize: 24 -
                              MediaQuery.of(context).size.width *
                                  (notifier.progress * 0.05),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    AnimatedPadding(
                      duration: Duration(milliseconds: 500),
                      padding: EdgeInsets.only(
                        top: notifier.currentIndex != -1 ? 0 : 40,
                      ),
                      child: Text(
                        "Gire o cartão para visualizar o código de segurança",
                        style: TextStyle(
                          fontSize: 13 -
                              MediaQuery.of(context).size.width *
                                  (notifier.progress * 0.05),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
