import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:sinterface/controllers/orders.dart';
import 'package:sinterface/models/order.dart';
import 'package:sinterface/models/product.dart';

final getIt = GetIt.instance;

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  static const route = "/order";

  @override
  Widget build(BuildContext context) {
    final order = getIt<OrdersController>().current;
    if (order == null) {
      Navigator.of(context).pop();
    }
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Bloc(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Customer",
                        style: theme.textTheme.displaySmall,
                      ),
                      IconButton(icon: Icon(Icons.edit), onPressed: () {})
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          enabled: false,
                          style: theme.textTheme.headlineMedium,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First name',
                              labelStyle: theme.textTheme.headlineSmall),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            enabled: false,
                            style: theme.textTheme.headlineMedium,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Last name',
                                labelStyle: theme.textTheme.headlineSmall),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Contacts",
                    style: theme.textTheme.headlineMedium,
                  ),
                  Column(
                    children:
                        List.filled(3, ContactListItem(title: "+380668735934")),
                  ),
                  TextField(
                    maxLines: 4,
                    enabled: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Note",
                        labelStyle: theme.textTheme.headlineSmall),
                  )
                ],
              ),
            ),
            VerticalDivider(),
            Expanded(
              flex: 3,
              child: Bloc(
                children: [
                  Text(
                    "Products",
                    style: theme.textTheme.displaySmall,
                  ),
                  Column(
                    children: order!.products
                        .map(
                          (e) => ProductListItem(product: e),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
            VerticalDivider(),
            Expanded(
              child: Bloc(
                children: [
                  Text(
                    "Control panel",
                    style: theme.textTheme.displaySmall,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Hero(
                tag: product.title,
                child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(product.picture),
                          fit: BoxFit.cover),
                    )),
              ),
              Text(product.title),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
    );
  }
}

class Bloc extends StatelessWidget {
  const Bloc({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class ContactListItem extends StatelessWidget {
  const ContactListItem(
      {super.key,
      required this.title,
      this.leading,
      this.trailing,
      this.onTap});

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap ?? () {},
      trailing: trailing,
      leading: leading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
