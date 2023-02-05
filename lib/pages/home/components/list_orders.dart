import 'package:flutter/material.dart';

class ListOrders extends StatelessWidget {
  const ListOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
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
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Text(index.toString()),
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
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: StatusWidget(),
                      ),
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
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(15)),
      child: Text(
        "Status",
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
