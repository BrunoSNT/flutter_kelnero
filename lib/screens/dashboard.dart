import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelnero/screens/home.dart';

import 'package:kelnero/style/colors.dart';
import 'package:kelnero/utils/menu.dart';
import 'package:kelnero/widgets/unie_button.dart';

class DashboardScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _page = 0;
  PageController _pageController;

  Future<Menu> fetchMenu() async {
    print("SENDING REQUEST");
    final response =
        await http.get('http://kelnero.herokuapp.com/v1/restaurants/1/menu');
    print("RESQUEST SENT");
    if (response.statusCode == 200) {
      print("SUCCESS");
      return Menu.fromJson(json.decode(response.body));
    } else {
      print("FAIL");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Menu> futureMenu;

  @override
  void initState() {
    futureMenu = fetchMenu();
    _pageController = PageController();
    super.initState();
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
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
              SearchWidget(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ItemAndDivider(
                          text: 'sua conta',
                        ),
                        Center(
                          child: FutureBuilder<Menu>(
                            future: futureMenu,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data.menu);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              // By default, show a loading spinner.
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SelectImage(
                              callback: () {},
                            ),
                            Text(
                              'nick nicholas',
                              style: TextStyle(
                                  fontSize: 26,
                                  color: nnWhite,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              ItemAndDivider(
                                text: 'formas de pagamento',
                              ),
                              CarouselSlider(
                                items: [
                                  CardOption(),
                                  CardOption(),
                                  CardOption()
                                ],
                                options: CarouselOptions(
                                  height: 250,
                                  enableInfiniteScroll: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.8,
                                ),
                              ),
                              UnieButton(
                                width: MediaQuery.of(context).size.width / 1.25,
                                height: 50,
                                borderRadius: BorderRadius.circular(12),
                                color: nnWhite,
                                innerWidget: Text(
                                  'gerenciar',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              ItemAndDivider(
                                text: 'histórico de pedidos',
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                width: MediaQuery.of(context).size.width / 1.2,
                                height:
                                    MediaQuery.of(context).size.height / 1.4,
                                child: ListView(
                                  children: [
                                    OrderHistoryItem(
                                      status: 0,
                                    ),
                                    OrderHistoryItem(
                                      status: 1,
                                    ),
                                    OrderHistoryItem(
                                      status: 0,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              "busca",
              style: TextStyle(fontSize: 14),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.wallet,
              size: 26,
            ),
            title: Text(
              "conta",
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

class ItemAndDivider extends StatelessWidget {
  const ItemAndDivider({
    @required String text,
    Key key,
  })  : _text = text,
        super(key: key);

  final String _text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 50.0, left: MediaQuery.of(context).size.width / 18),
              child: Text(
                _text,
                style: TextStyle(
                    fontSize: 26.0,
                    color: nnWhite,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: MediaQuery.of(context).size.width / 18),
          height: 2.0,
          color: nnWhite,
        ),
      ],
    );
  }
}

class OrderHistoryItem extends StatefulWidget {
  const OrderHistoryItem({
    @required int status,
    Key key,
  })  : _status = status,
        super(key: key);
  final int _status;
  @override
  _OrderHistoryItemState createState() => _OrderHistoryItemState();
}

class _OrderHistoryItemState extends State<OrderHistoryItem> {
  Color _cardColor;
  @override
  void initState() {
    if (widget._status == 1) {
      _cardColor = Colors.red;
    } else {
      _cardColor = Colors.green;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: nnWhite,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                topLeft: Radius.circular(12.0),
              ),
            ),
            height: 125.0,
            width: 8.0,
          ),
          Container(
            height: 125.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('R\$ 25,00'),
                Text('3x\nPepsi'),
              ],
            ),
          ),
          Container(
            height: 125.0,
            width: 2.0,
            color: nnGrey,
          ),
          Container(
            height: 125.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('barzinho de tradutores'),
                Text('Hoje\n12/12/2020'),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          ),
          Container(
            height: 125.0,
            width: 8.0,
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          width: MediaQuery.of(context).size.width / 1.2,
          child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: nnWhite,
              cursorColor: nnWhite,
              //errorColor: myKiefRed,
            ),
            child: TextFormField(
              //autovalidate: _autoValidate,
              keyboardType: TextInputType.text,
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
    );
  }
}

class SelectImage extends StatefulWidget {
  final Function callback;

  SelectImage({Key key, @required Function callback})
      : callback = callback,
        super(
          key: key,
        );

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File _image;

  _SelectImageState();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      animatedColor = Colors.black12;
    });
    widget.callback(_image);
  }

  Color animatedColor = nnGrey;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      width: 86 * (MediaQuery.of(context).size.width / 250),
      height: 86 * (MediaQuery.of(context).size.width / 250),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(250),
        border: Border.all(color: this.animatedColor, width: 5),
      ),
      child: InkWell(
        highlightColor: nnGrey,
        splashColor: nnGrey,
        borderRadius: BorderRadius.circular(200),
        onTap: getImage,
        child: _image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo,
                    color: nnWhite,
                    size: 42,
                  ),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Hero(
                  tag: 'img',
                  child: Image.file(_image, fit: BoxFit.cover),
                ),
              ),
      ),
    );
  }
}

class CardOption extends StatelessWidget {
  const CardOption({
    Function callback,
    Function subCallback,
    Key key,
  })  : _callback = callback,
        _subCallback = subCallback,
        super(key: key);

  final Function _callback;
  final Function _subCallback;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            height: 200,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                color: nnWhite, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            'U',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: nnNightBlue),
                          ),
                          Text(
                            'Bank',
                            style: TextStyle(fontSize: 28, color: nnNightBlue),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 15, bottom: 7),
                      child: Text('KELNERO',
                          style: GoogleFonts.righteous(
                              fontSize: 24, color: nnNightBlue)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                        child: Transform.rotate(
                            angle: 1.57,
                            child: Icon(
                              FontAwesomeIcons.sdCard,
                              size: 44,
                              color: nnNightBlue,
                            ))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '1234',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: nnNightBlue),
                    ),
                    Text(
                      '5678',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: nnNightBlue),
                    ),
                    Text(
                      '9101',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: nnNightBlue),
                    ),
                    Text(
                      '1121',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: nnNightBlue),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Text(
                          '11/24',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: nnNightBlue),
                        )
                      ]),
                      Row(
                        children: [
                          Text(
                            'JANNY DOE',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: nnNightBlue),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
