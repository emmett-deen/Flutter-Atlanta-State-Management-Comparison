import 'package:flutter/material.dart';

import 'bloc/screens/bloc_product_listing_screen.dart';

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
              builder: (context) => BlocProductListingScreen(),
            ));
          },
        )
      ]
    ),
    );
  }
}
