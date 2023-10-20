import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final image, category, name, details, price;
  const ProductDetailsScreen(
      {Key? key,
      this.image,
      this.category,
      this.name,
      this.details,
      this.price})
      : super(key: key);
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool _isfav = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.image,
              child: Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.image),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'SmallFont',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    widget.category,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    widget.details,
                    style: const TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isfav = !_isfav;
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: _isfav
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.orange,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                            ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: const Color(0xff161616)),
                    child: Center(
                        child: Text(
                      'Buy For Rs - ${widget.price}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
