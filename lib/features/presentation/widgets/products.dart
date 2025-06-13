import 'package:flutter/material.dart';
import 'package:hive_lesson/core/services/hive_product.dart';
import 'package:hive_lesson/features/data/models/products_model.dart';

class Products extends StatelessWidget {
  final List<Datum> products;
  const Products({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 280,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey.shade100,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 160,
                    child: Image.network(
                      "https://i.guim.co.uk/img/media/18badfc0b64b09f917fd14bbe47d73fd92feeb27/189_335_5080_3048/master/5080.jpg?width=620&dpr=2&s=none&crop=none",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(products[index].nameUz),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                HiveProduct().insertData(
                                  name: products[index].nameUz,
                                  image:
                                      "https://i.guim.co.uk/img/media/18badfc0b64b09f917fd14bbe47d73fd92feeb27/189_335_5080_3048/master/5080.jpg?width=620&dpr=2&s=none&crop=none",
                                );
                                HiveProduct().readAlldata();
                              },
                              icon: Icon(Icons.add, size: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
