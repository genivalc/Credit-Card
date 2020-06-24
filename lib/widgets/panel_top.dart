import 'package:CreditCard/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControllerApp>(
      builder: (context, value, child) {
        return AnimatedOpacity(
          child: child,
          opacity: value.currentIndex != -1 ? 0 : 1,
          curve: Curves.easeInCubic,
          duration: Duration(
            milliseconds: 400,
          ),
        );
      },
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cartões Bancários',
                      style: TextStyle(
                          fontSize:
                              25 + MediaQuery.of(context).size.width * 0.010,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Saldo",
                        style: TextStyle(
                            fontSize:
                                16 + MediaQuery.of(context).size.width * 0.001,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text("R\$234",
                        style: TextStyle(
                            fontSize:
                                32 + MediaQuery.of(context).size.width * 0.001,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
