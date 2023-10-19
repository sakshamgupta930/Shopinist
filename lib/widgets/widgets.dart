import 'package:flutter/material.dart';

class MainArea extends StatelessWidget {
  const MainArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 8, right: 10),
          child: Row(
            children: [
              Image(
                height: 40,
                width: 40,
                image: AssetImage('assets/icons/menus.png'),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(
                      height: 20,
                      width: 30,
                      image: AssetImage(
                          'assets/icons/search-interface-symbol.png'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(
                      height: 20,
                      width: 30,
                      image: AssetImage('assets/icons/scanner.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Discover',
            style: TextStyle(
              fontSize: 45,
              fontFamily: 'LargeFont',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'For you',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'New Arrivals',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Accessories',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
