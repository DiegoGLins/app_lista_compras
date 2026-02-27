import 'package:app_lista_compras/data/app_data.dart';
import 'package:app_lista_compras/model/buyList.model.dart';
import 'package:app_lista_compras/model/product.model.dart';
import 'package:app_lista_compras/pages/add_product.dart';
import 'package:flutter/material.dart';

class DetailBuyList extends StatefulWidget {
  final int idxNameList;
  const DetailBuyList({super.key, required this.idxNameList});

  @override
  State<DetailBuyList> createState() => _DetailBuyListState();
}

class _DetailBuyListState extends State<DetailBuyList> {
  late BuyListModel originalList;
  late BuyListModel tempList;

  @override
  void initState() {
    super.initState();

    originalList = AppData.allLists[widget.idxNameList];
    tempList = BuyListModel(
      name: originalList.name,
      products: originalList.products
          .map(
            (p) => ProductModel(
              titleProduct: p.titleProduct,
              priceProduct: p.priceProduct,
              checked: p.checked,
            ),
          )
          .toList(),
    );
  }

  void addProduct() async {
    final newProduct = await showModalBottomSheet<ProductModel>(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddProduct(),
    );
    if (newProduct != null) {
      setState(() {
        AppData.allLists[widget.idxNameList].products.add(newProduct);
      });
    }
  }

  void upDateList() {
    AppData.allLists[widget.idxNameList] = tempList;
    Navigator.of(context).pop(true); // avisa a Home
  }

  @override
  Widget build(BuildContext context) {
    final selectedList = AppData.allLists[widget.idxNameList];
    final products = selectedList.products;
    final totalMarcados = products
        .where((p) => p.checked)
        .fold(0.0, (sum, item) => sum + item.priceProduct);

    final totalNaoMarcados = products
        .where((p) => !p.checked)
        .fold(0.0, (sum, item) => sum + item.priceProduct);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset("assets/images/chevron.png", height: 40),
              ),
              InkWell(
                key: Key("updateListBtn"),
                onTap: upDateList,
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  selectedList.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const Divider(thickness: 1.5),
              ),
              const SizedBox(height: 10),

              Column(
                children: List.generate(products.length, (index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12, right: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              product.checked = !product.checked;
                            });
                          },
                          child: Container(
                            key: Key("productCheckbox"),
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: product.checked
                                  ? Colors.green
                                  : Colors.transparent,
                              border: Border.all(
                                color: product.checked
                                    ? Colors.green
                                    : Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: product.checked
                                ? const Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            product.titleProduct,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          "R\$ ${product.priceProduct.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Não marcados",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "R\$ ${totalNaoMarcados.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 40),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Marcados", style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(
                          "R\$ ${totalMarcados.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: InkWell(
        key: Key("addNewItemBtn"),
        onTap: addProduct,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 140,
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white),
          ),
          alignment: Alignment.center,
          child: const Text(
            "Adicionar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
