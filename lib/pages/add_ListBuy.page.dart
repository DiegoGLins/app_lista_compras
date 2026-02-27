import 'package:app_lista_compras/data/app_data.dart';
import 'package:app_lista_compras/model/buyList.model.dart';
import 'package:app_lista_compras/pages/home_buy_list.dart';
import 'package:flutter/material.dart';

class AddListBuy extends StatefulWidget {
  const AddListBuy({super.key});

  @override
  State<AddListBuy> createState() => _AddListBuyState();
}

class _AddListBuyState extends State<AddListBuy> {
  final nameListController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void createListBuy() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    var nameList = nameListController.text.trim();

    final nameExists = AppData.allLists.any(
      (list) => list.name.toLowerCase() == nameList.toLowerCase(),
    );

    if (nameExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Já existe uma lista com esse nome"),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final newList = BuyListModel(name: nameList, products: []);

    AppData.allLists.add(newList);
    nameListController.clear();
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => HomeBuyList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: TextFormField(
                      key: Key("listNameInput"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                      controller: nameListController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Nome da lista",
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        key: Key("backToListsBtn"),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeBuyList(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Voltar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: InkWell(
                        key: Key("createListBtn"),
                        onTap: createListBuy,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Criar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
