import 'package:kelnero/utils/categories.dart';

class Menu {
  final String menu;

  Menu({this.menu});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menu: json['menu'],
    );
  }
}