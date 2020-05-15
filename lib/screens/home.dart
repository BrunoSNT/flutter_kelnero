import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelnero/screens/dashboard.dart';
import 'package:kelnero/style/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: PageView(
        onPageChanged: pageState,
        controller: _pageController,
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LogoTitle(title: 'KELNERO'),
                  QRCode(text: 'sentar na mesa'),
                  BottomCarousel(
                    infiniteScroll: true,
                    viewPort: 0.7,
                    text: 'restaurantes',
                    textAlign: MainAxisAlignment.center,
                    carouselHeight: 250.0,
                    items: [
                      NNCard(
                          cardWidth: 250,
                          innerWidget: InnerRestaurant(),
                          image: Image.asset('assets/mc-c.png', height: 185.0, fit: BoxFit.cover,),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(),
        ],
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

class BottomCarousel extends StatelessWidget {
  const BottomCarousel({
    @required String text,
    @required List<Widget> items,
    @required double carouselHeight,
    @required double viewPort,
    @required bool infiniteScroll,
    @required MainAxisAlignment textAlign,
    Key key,
  })  : _text = text,
        _textAlign = textAlign,
        _items = items,
        _viewPort = viewPort,
        _infiniteScroll = infiniteScroll,
        _carouselHeight = carouselHeight,
        super(key: key);

  final bool _infiniteScroll;
  final String _text;
  final double _carouselHeight;
  final double _viewPort;
  final MainAxisAlignment _textAlign;
  final List<Widget> _items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 9,
              left: MediaQuery.of(context).size.width / 9,
              bottom: 20.0,
              top: 40.0),
          child: Row(
            mainAxisAlignment: _textAlign,
            children: [
              Text(
                _text,
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w700, color: nnWhite),
              ),
            ],
          ),
        ),
        CarouselSlider(
          items: _items,
          options: CarouselOptions(
            height: _carouselHeight,
            enableInfiniteScroll: _infiniteScroll,
            enlargeCenterPage: false,
            autoPlay: true,
            viewportFraction: _viewPort,
          ),
        ),
      ],
    );
  }
}

class QRCode extends StatelessWidget {
  const QRCode({
    @required text,
    Key key,
  })  : _text = text,
        super(key: key);

  final String _text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) {
                return DashboardScreen();
              },
              fullscreenDialog: true),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                _text,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: nnWhite),
              ),
            ),
            SizedBox(
                height: 256,
                width: 256,
                child: Image.asset(
                  'assets/qrcode03.png',
                  color: nnWhite,
                )),
          ],
        ),
      ),
    );
  }
}

class LogoTitle extends StatelessWidget {
  const LogoTitle({
    @required String title,
    Key key,
  })  : _title = title,
        super(key: key);

  final String _title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Text(_title,
            style: GoogleFonts.righteous(fontSize: 42, color: nnWhite)),
      ),
    );
  }
}

class NNCard extends StatelessWidget {
  const NNCard({
    @required Image image,
    @required double cardWidth,
    @required Widget innerWidget,
    Key key,
  })  : _image = image,
        _cardWidth = cardWidth,
        _innerWidget = innerWidget,
        super(key: key);

  final Image _image;
  final double _cardWidth;
  final Widget _innerWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: nnWhite, borderRadius: BorderRadius.circular(12.0)),
      width: _cardWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          children: [
            _image,
            _innerWidget,
          ],
        ),
      ),
    );
  }
}

class InnerRestaurant extends StatelessWidget {
  const InnerRestaurant({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'McDonald’s',
                  style: TextStyle(color: nnNightBlue),
                ),
              ),
              Container(
                width: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: nnNightBlue,
                      size: 16,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: nnNightBlue,
                      size: 16,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: nnNightBlue,
                      size: 16,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: nnNightBlue,
                      size: 16,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStarHalf,
                      color: nnNightBlue,
                      size: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '800 metros',
                  style: TextStyle(color: nnNightBlue),
                ),
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.dollarSign,
                    color: nnNightBlue,
                    size: 16,
                  ),
                  Icon(
                    FontAwesomeIcons.dollarSign,
                    color: nnNightBlue,
                    size: 16,
                  ),
                  Icon(
                    FontAwesomeIcons.dollarSign,
                    color: nnNightBlue,
                    size: 16,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class InnerItem extends StatelessWidget {
  const InnerItem({
    @required String itemName,
    @required String itemPrice,
    Key key,
  })  : _itemName = itemName,
        _itemPrice = itemPrice,
        super(key: key);

  final String _itemName;
  final String _itemPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  _itemName,
                  style: TextStyle(color: nnNightBlue, fontSize: 18),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  _itemPrice,
                  style: TextStyle(color: nnNightBlue, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
