import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/imc_history.dart';
import 'package:flutter_application_1/pages/imc_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  imcPage(),
                  ImcHistory(),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            pageController.jumpToPage(value);
          },
          currentIndex: posicaoPagina,
          items: const [
            BottomNavigationBarItem(
              label: "IMC",
              icon: Icon(Icons.calculate),
            ),
            BottomNavigationBarItem(
              label: "History",
              icon: Icon(Icons.history),
            ),
          ],
        ),
      ),
    );
  }
}
