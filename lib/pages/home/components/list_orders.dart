import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sinterface/controllers/orders.dart';
import 'package:sinterface/pages/order/order.dart';

final getIt = GetIt.instance;

class ListOrders extends StatelessWidget {
  const ListOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = getIt<OrdersController>();
    return ListView.builder(
      itemCount: controller.list.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Ink(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).canvasColor,
            boxShadow: const [BoxShadow()],
          ),
          child: InkWell(
            onTap: () {
              controller.setCurrentOrder(index);
              Navigator.of(context).pushNamed(OrderPage.route);
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: controller.list[index].products[0].title,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              controller.list[index].products[0].picture),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Example product order",
                                style: theme.textTheme.headlineSmall),
                            Text(
                              "Small desc",
                              style: theme.textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "1267.84 UAH",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      StatusWidget(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            size: 30,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(15)),
      child: Text(
        "Status",
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
