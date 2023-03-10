import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sinterface/controllers/orders.dart';
import 'package:sinterface/pages/home/components/list_orders.dart';
import 'package:sinterface/pages/order/order.dart';

final getIt = GetIt.instance;

class GridOrders extends StatefulWidget {
  const GridOrders({super.key});

  @override
  State<GridOrders> createState() => _GridOrdersState();
}

class _GridOrdersState extends State<GridOrders> {
  int? isHovered;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final cardsAmount = (size.width / 300.0).round();
    final controller = getIt<OrdersController>();
    final scrollController = ScrollController();
    return Scrollbar(
      controller: scrollController,
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cardsAmount, mainAxisExtent: 305),
        itemCount: controller.list.length,
        itemBuilder: (context, index) => SizedBox(
            width: 300,
            height: 305,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                elevation: 10.0,
                margin: const EdgeInsets.all(10.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: () {
                    controller.setCurrentOrder(index);
                    Navigator.of(context).pushNamed(OrderPage.route);
                  },
                  child: Wrap(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Hero(
                              tag: controller.list[index].title,
                              child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            controller.list[index].picture),
                                        fit: BoxFit.cover),
                                  )),
                            ),
                            Positioned(
                              child: StatusWidget(),
                              top: 10,
                              right: 10,
                            ),
                            Positioned(
                                left: 15,
                                top: 15,
                                child: Text(
                                  index.toString(),
                                  style: theme.textTheme.titleLarge,
                                )),
                            Positioned(
                                left: 15,
                                bottom: 15,
                                child: Text(
                                  "Olexander Cuzenko",
                                  style: theme.textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                                right: 15,
                                bottom: 15,
                                child: Text("1267.84 UAH"))
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Wrap(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lenovo ideaPad 5 pra sdd aaaaaaaaaaaaaaao $index",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.headlineSmall
                                        ?.copyWith(color: Colors.red),
                                  ),
                                  Text("Maybe some info about count cost city",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis),
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}

// void name(params) {
//   Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         child: Ink(
//           height: 100,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Theme.of(context).canvasColor,
//             boxShadow: const [BoxShadow()],
//           ),
//           child: InkWell(
//             onTap: () {},
//             borderRadius: BorderRadius.circular(20),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         child: Text(index.toString()),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Example product order",
//                                 style: theme.textTheme.headlineSmall),
//                             Text(
//                               "Small desc",
//                               style: theme.textTheme.headlineSmall,
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                         child: Container(
//                           padding: const EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                               color: Colors.orange,
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Text(
//                             "Status",
//                             style: theme.textTheme.titleLarge,
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.more_vert,
//                             size: 30,
//                           ))
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       )
// }
