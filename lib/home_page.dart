import 'package:flutter/material.dart';
import 'package:flutter_atlanta_state_management_comparison/get/screens/get_product_listing_screen.dart';

import 'bloc/screens/bloc_product_listing_screen.dart';
import 'riverpod/screens.dart/riverpod_product_listing_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Flutter State Management Demo'),
    ),
    body: ListView(
      children: [
        ListTile(
          title: const Text('Bloc'),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const BlocProductListingScreen(),
            ));
          },
        ),
        ListTile(
          title: const Text('Get'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GetProductListingScreen(),
            ));
          },
        ),
        ListTile(
          title: const Text('Riverpod'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RiverpodProductListingScreen(),
            ));
          },
        )
      ]
    ),
    );
  }
}
