import 'package:app_lista_compras/data/app_data.dart';
import 'package:app_lista_compras/pages/add_ListBuy.page.dart';
import 'package:app_lista_compras/pages/detail_buyList.page.dart';
import 'package:flutter/material.dart';

class HomeBuyList extends StatefulWidget {
  const HomeBuyList({super.key});

  @override
  State<HomeBuyList> createState() => _HomeBuyListState();
}

class _HomeBuyListState extends State<HomeBuyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          key: Key("appBarTitle"),
          "Minhas listas",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4CAF50),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.diamond, color: Colors.amber[600], size: 32),
          ),
        ],
      ),
      body: AppData.allLists.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      key: Key("emptyListImage"),
                      "assets/images/lista_de_compras.png",
                      width: 100,
                      height: 120,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Crie sua primeira lista.\n Toque no botão azul",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: AppData.allLists.length,
              itemBuilder: (context, index) {
                final nameList = AppData.allLists[index];
                final totalProducts = nameList.products.length;

                final totalMarcados = nameList.products
                    .where((p) => p.checked == true)
                    .length;

                final progresso = totalProducts == 0
                    ? 0.0
                    : totalMarcados / totalProducts;

                return Card(
                  key: Key("shoppingListCard"),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailBuyList(idxNameList: index),
                        ),
                      );
                      if (result == true) {
                        setState(() {});
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                nameList.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "$totalMarcados",
                                      style: TextStyle(
                                        color: Color(0xff4CAF50),
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " / ",
                                      style: TextStyle(
                                        color: Color(0xff4CAF50),
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "$totalProducts",
                                      style: TextStyle(
                                        color: Color(0xff4CAF50),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          LinearProgressIndicator(
                            value: progresso,
                            minHeight: 6,
                            borderRadius: BorderRadius.circular(10),
                            backgroundColor: Colors.grey[300],
                            color: progresso == 1
                                ? Colors.green
                                : const Color(0xFF4CAF50),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: Padding(
        key: Key("addListBtn"),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: SizedBox(
          height: 58,
          width: 58,
          child: Material(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => AddListBuy()));
              },
              borderRadius: BorderRadius.circular(100),
              child: Align(
                alignment: Alignment.center,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
