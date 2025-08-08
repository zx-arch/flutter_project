import 'package:intl/intl.dart';
import '../../model/product.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker_lib;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    final List<String> pphTypes = [
      'PPh Pasal 22',
      'PPh 22',
      'PPh 23',
      'PPh Pasal 4 (2)',
      'PPh 22 Final',
      'PPh 23 Final',
      'PPh',
    ];

    final List<String> ppnTypes = [
      'PPN 12%',
      'Bebas PPN',
      'Pajak Daerah 8%',
      'PPN 1,2%',
      'Pajak Daerah 10%',
      'Pajak Daerah 6%',
    ];

    String randomPphType() {
      return pphTypes[faker_lib.random.integer(pphTypes.length)];
    }

    String randomPpnType() {
      return ppnTypes[faker_lib.random.integer(ppnTypes.length)];
    }

    List<Product> products = List.generate(
      20,
      (index) => Product(
        name: faker_lib.faker.food.dish(),
        imageUrl: "https://picsum.photos/200/300?random=$index",
        price: faker_lib.faker.randomGenerator.decimal(scale: 1000000),
        ppn: randomPpnType(),
        pph: randomPphType(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: false,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.66,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: SizedBox(
                      width: double.infinity,
                      height: 160,
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: -4,
                    children: [
                      Chip(
                        label: Text(currencyFormatter.format(product.price.round())),
                        backgroundColor: Colors.blue.shade50,
                        labelStyle: const TextStyle(fontSize: 11, color: Colors.blue),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        visualDensity: VisualDensity.compact,
                      ),
                      Chip(
                        label: Text(product.ppn),
                        backgroundColor: Colors.green.shade50,
                        labelStyle: const TextStyle(fontSize: 11, color: Colors.green),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        visualDensity: VisualDensity.compact,
                      ),
                      Chip(
                        label: Text(product.pph),
                        backgroundColor: Colors.red.shade50,
                        labelStyle: const TextStyle(fontSize: 11, color: Colors.red),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(-1.0, 1.0),
                        child: const Icon(Icons.add_shopping_cart, size: 18),
                      ),
                    ),
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