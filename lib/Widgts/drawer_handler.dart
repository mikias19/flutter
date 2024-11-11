import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.onPrimary,
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.96),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.food_bank,
                      size: 24,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  const SizedBox(width: 8),
                  Text(
                    "Cooking ",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 28,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Resturant'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
