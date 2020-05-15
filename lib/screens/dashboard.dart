import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kelnero/screens/home.dart';

import 'package:kelnero/style/colors.dart';

class DashboardScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _page = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  void animateToPage(p) {
    _pageController.animateToPage(p,
        duration: Duration(milliseconds: 250), curve: Curves.ease);
  }

  void pageState(page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nnNightBlue,
      body: SafeArea(
        child: PageView(
          onPageChanged: pageState,
          controller: _pageController,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BottomCarousel(
                    infiniteScroll: true,
                    viewPort: 0.8,
                    text: 'principais',
                    textAlign: MainAxisAlignment.start,
                    carouselHeight: 200.0,
                    items: [
                      NNCard(
                          cardWidth: 300,
                          innerWidget: InnerItem(
                            itemName: 'Pepsi',
                            itemPrice: 'R\$ 30,00',
                          ),
                          image: Image.asset(
                            'assets/mc-c.png',
                            width: 300,
                            height: 155,
                            fit: BoxFit.cover,
                          ))
                    ],
                  ),
                  BottomCarousel(
                    infiniteScroll: false,
                    viewPort: 0.6,
                    text: 'aperitivos',
                    textAlign: MainAxisAlignment.start,
                    carouselHeight: 200,
                    items: [
                      NNCard(
                        cardWidth: 190,
                        innerWidget: InnerItem(
                          itemName: 'Pepsi',
                          itemPrice: 'R\$ 30,00',
                        ),
                        image: Image.asset(
                          'assets/mc-c.png',
                          width: 205,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                      NNCard(
                        cardWidth: 190,
                        innerWidget: InnerItem(
                          itemName: 'Pepsi',
                          itemPrice: 'R\$ 30,00',
                        ),
                        image: Image.asset(
                          'assets/mc-c.png',
                          width: 205,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                      NNCard(
                        cardWidth: 190,
                        innerWidget: InnerItem(
                          itemName: 'Pepsi',
                          itemPrice: 'R\$ 30,00',
                        ),
                        image: Image.asset(
                          'assets/mc-c.png',
                          width: 205,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                      NNCard(
                        cardWidth: 190,
                        innerWidget: InnerItem(
                          itemName: 'Pepsi',
                          itemPrice: 'R\$ 30,00',
                        ),
                        image: Image.asset(
                          'assets/mc-c.png',
                          width: 205,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  BottomCarousel(
                    infiniteScroll: false,
                    viewPort: 0.6,
                    text: 'bebidas',
                    textAlign: MainAxisAlignment.start,
                    carouselHeight: 200.0,
                    items: [
                      NNCard(
                        cardWidth: 190,
                        innerWidget: InnerItem(
                          itemName: 'Pepsi',
                          itemPrice: 'R\$ 30,00',
                        ),
                        image: Image.asset(
                          'assets/mc-c.png',
                          width: 205,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                      NNCard(
                        cardWidth: 190,
                        innerWidget: InnerItem(
                          itemName: 'Pepsi',
                          itemPrice: 'R\$ 30,00',
                        ),
                        image: Image.asset(
                          'assets/mc-c.png',
                          width: 205,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                      NNCard(
                        cardWidth: 190,
                        innerWidget: InnerItem(
                          itemName: 'Pepsi',
                          itemPrice: 'R\$ 30,00',
                        ),
                        image: Image.asset(
                          'assets/mc-c.png',
                          width: 205,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                      NNCard(
                        cardWidth: 190,
                        innerWidget: InnerItem(
                          itemName: 'Pepsi',
                          itemPrice: 'R\$ 30,00',
                        ),
                        image: Image.asset(
                          'assets/mc-c.png',
                          width: 205,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        primaryColor: nnWhite,
                        cursorColor: nnWhite,
                        //errorColor: myKiefRed,
                      ),
                      child: TextFormField(
                        //autovalidate: _autoValidate,
                        keyboardType: TextInputType.phone,
                        //validator: validatePassword,
                        onSaved: (val) {
                          //this.passWord = val;
                        },
                        style: TextStyle(color: nnWhite),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: nnWhite),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: nnWhite),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: 'Buscar no cardápio',
                          hintStyle: TextStyle(fontSize: 18, color: nnGrey),
                          errorStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(FontAwesomeIcons.search),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: nnNightBlue,
        currentIndex: _page,
        onTap: animateToPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 26,
            ),
            title: Text(
              "home",
              style: TextStyle(fontSize: 14),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.search,
              size: 26,
            ),
            title: Text(
              "pesquisa",
              style: TextStyle(fontSize: 14),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.wallet,
              size: 26,
            ),
            title: Text(
              "carteira",
              style: TextStyle(fontSize: 14),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
              size: 26,
            ),
            title: Text(
              "perfil",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
