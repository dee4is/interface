import 'package:sinterface/models/product.dart';

import '../models/order.dart';

class OrdersController {
  Order? current;
  late List<Order> list;

  void setCurrentOrder(int idx) => current = list[idx];

  OrdersController() {
    list = List.generate(
        100,
        (index) => Order(
            "http://source.unsplash.com/random",
            index.toString(),
            index.toString(),
            List.generate(
                3,
                (index) => Product("http://source.unsplash.com/random",
                    "Little describe", "Lenovo laptop $index"))));
  }
}
