import 'package:app_lista_compras/pages/add_ListBuy.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePage> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
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
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        key: Key("addListBtn"),
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
