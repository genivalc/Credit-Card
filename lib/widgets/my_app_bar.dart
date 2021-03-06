import 'package:CreditCard/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08 +
              MediaQuery.of(context).padding.top,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 12, vertical: MediaQuery.of(context).padding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () async {
                      Provider.of<PageControllerApp>(context, listen: false)
                          .setCurrentIndex(-1);
                      await Provider.of<PageControllerApp>(context,
                              listen: false)
                          .hideSheet();
                    }),
                Consumer<PageControllerApp>(
                  builder: (context, value, child) {
                    return AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: value.currentIndex != -1 ? 1 : 0,
                        child: child);
                  },
                  child: IconButton(
                      icon: Icon(Icons.check_circle_outline), onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
