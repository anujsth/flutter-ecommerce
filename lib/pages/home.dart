import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practive/models/catalog.dart';
import 'package:practive/pages/home_detail_page.dart';
import 'package:practive/widgets/drawer.dart';
import 'package:practive/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    bool changed = false;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text("Catalog App",
            style: TextStyle(color: Theme.of(context).accentColor)),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/CartPage');
        },
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(CupertinoIcons.cart),
        mini: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.getByPos(index);
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(item: item)));
                    },
                    child: Card(
                        color: Theme.of(context).cardColor,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(children: [
                          Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: Key(item.id.toString()),
                                      child: Image.network(
                                        item.image,
                                        height: 100,
                                        width: 90,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: Colors.blue[200],
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Text(
                                          item.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 6, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('\$${item.price}',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 35,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            print('tapped');
                                            changed = true;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          alignment: Alignment.center,
                                          height: 20,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color:
                                                Theme.of(context).buttonColor,
                                          ),
                                          duration: Duration(seconds: 1),
                                          child: changed
                                              ? Icon(Icons.shopping_bag,
                                                  color: Colors.white)
                                              : Center(
                                                  child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    'Add to cart',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                )),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          )
                        ])),
                  );
                },
                itemCount: CatalogModel.item.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
