import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});
  static const routeName = "/add_product";

  @override
  AddProductPageState createState() => AddProductPageState();
}

class AddProductPageState extends State<AddProductPage> {
  TextEditingController titleController = TextEditingController();

  void pilihTanggal() async {
    final now = DateTime.now();
    final firstDay = DateTime(now.year, 1, 1);   // 1 Januari tahun ini
    final lastDay = DateTime(now.year, 12, 31);  // 31 Desember tahun ini

    final value = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDay,
      lastDate: lastDay,
    );

    if (value != null) {
      setState(() {
        date = value;
      });
    }
  }

  DateTime? date;

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              products.addProduct(titleController.text, date!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextField(
                autocorrect: false,
                controller: titleController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        (date == null)
                            ? "No date chosen..."
                            : DateFormat().add_yMMMMd().format(date!),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: pilihTanggal,
                      child: Text(
                        "Select Date",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}