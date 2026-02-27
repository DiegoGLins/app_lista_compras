import 'package:app_lista_compras/model/product.model.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final titleProductController = TextEditingController();
  final priceProductController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var isChecked = false;

  void addProduct() {
    if (!formKey.currentState!.validate()) return;

    final product = ProductModel(
      titleProduct: titleProductController.text,
      priceProduct: double.parse(
        priceProductController.text.replaceAll(',', '.'),
      ),
      checked: isChecked,
    );
    Navigator.of(context).pop(product);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adicionar item",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Divider(thickness: 2, height: 0),
            SizedBox(height: 15),
            TextFormField(
              key: Key("inputItem"),
              controller: titleProductController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nome do item",
                hintStyle: TextStyle(fontSize: 20),
              ),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Campo obrigatório";
                }
                return null;
              }),
            ),
            TextFormField(
              key: Key("inputValue"),
              controller: priceProductController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "R\$ 0,00",
                hintStyle: TextStyle(fontSize: 20),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo obrigatório";
                }

                final price = double.tryParse(value.replaceAll(',', '.'));

                if (price == null) {
                  return "Digite um valor válido";
                }

                if (price <= 0) {
                  return "Valor deve ser maior que zero";
                }

                return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextButton(
                  key: Key("addItemBtn"),
                  onPressed: addProduct,
                  child: const Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
