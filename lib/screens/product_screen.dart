import 'package:ecommerce_app/screens/prooduct_details_screen.dart';
import 'package:ecommerce_app/services/productApi.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final title, id, image;
  const ProductScreen({super.key, this.title, this.id, this.image});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.image,
              child: Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.image),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Adjust the padding as needed
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 40,
                          fontFamily: "SmallFont",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Products",
              style: TextStyle(fontSize: 30, fontFamily: "SmallFont"),
            ),
            FutureBuilder(
              future: ProductApi().getProduct(widget.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    ],
                  ); // Loading indicator.
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No data available.');
                }
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 9 / 16,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              image: snapshot.data![index].images[0],
                              category: snapshot.data![index].category.name,
                              details: snapshot.data![index].description,
                              name: snapshot.data![index].title,
                              price: snapshot.data![index].price,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Hero(
                              tag: snapshot.data![index].images[0],
                              child: Container(
                                height: 220,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        snapshot.data![index].images[0]),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "SmallFont",
                                      fontSize: 15),
                                ),
                                Text(
                                  "Rs ${snapshot.data![index].price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
