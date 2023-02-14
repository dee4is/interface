import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sinterface/pages/home/components/grid_orders.dart';

import '../../colors.dart';
import 'components/list_orders.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });
  static const route = "/home";

  final _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: _controller,
            theme: SidebarXTheme(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: canvasColor,
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: const TextStyle(color: Colors.white),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                border: Border.all(color: canvasColor),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: actionColor.withOpacity(0.37),
                ),
                gradient: const LinearGradient(
                  colors: [accentCanvasColor, canvasColor],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  )
                ],
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            extendedTheme: const SidebarXTheme(
                width: 200,
                decoration: BoxDecoration(
                  color: canvasColor,
                ),
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(8)),
            footerDivider: divider,
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(
                icon: Icons.search,
                label: 'Search',
              ),
              SidebarXItem(
                icon: Icons.people,
                label: 'People',
              ),
              SidebarXItem(
                icon: Icons.favorite,
                label: 'Favorites',
              ),
            ],
          ),
          Expanded(
            child: _ScreensExample(controller: _controller),
          ),
        ],
      ),
    );
  }
}

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  bool isSearchOpen = false;
  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyF,
                control: true, includeRepeats: false):
            () => setState(() => isSearchOpen = !isSearchOpen)
      },
      child: Focus(
        autofocus: true,
        child: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, child) {
            switch (widget.controller.selectedIndex) {
              case 0:
                return Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      if (isSearchOpen)
                        const SizedBox(
                          height: 80,
                          child: Center(
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      const Expanded(
                        child: true ? ListOrders() : GridOrders(),
                      )
                    ],
                  ),
                );
              case 1:
                return Text(
                  'Search',
                );
              case 2:
                return Text(
                  'People',
                );
              case 3:
                return Text(
                  'Favorites',
                );
              case 4:
                return Text(
                  'Profile',
                );
              case 5:
                return Text(
                  'Settings',
                );
              default:
                return Text(
                  'Not found page',
                );
            }
          },
        ),
      ),
    );
  }
}

final divider = Divider(color: white.withOpacity(0.3), height: 1);
