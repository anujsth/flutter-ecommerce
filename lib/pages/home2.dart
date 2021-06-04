import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practive/models/catalog.dart';
import 'package:practive/widgets/drawer.dart';
import 'package:practive/widgets/item_widget.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodData = jsonDecode(catalogJson);
    var productData = decodData['products'];
    CatalogModel.item =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            Text('Catalogue App',
                style: TextStyle(fontSize: 1.2, fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }
}
