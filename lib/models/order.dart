import 'package:sinterface/models/product.dart';

class Order {
  String picture;
  String title;
  String desc;
  List<Product> products;

  Order(this.picture, this.desc, this.title, this.products);
}
