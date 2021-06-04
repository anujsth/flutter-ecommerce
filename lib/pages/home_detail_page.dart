import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practive/models/catalog.dart';

class DetailPage extends StatelessWidget {
  final Item item;

  const DetailPage({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${item.price}',
                style: TextStyle(
                    color: Colors.yellow, fontWeight: FontWeight.bold),
                textScaleFactor: 1.6,
              ),
              InkWell(
                  onTap: () {},
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                    duration: Duration(seconds: 1),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )),
                  ))
            ],
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Hero(
                  tag: Key(item.id.toString()),
                  child: Center(
                    child: Image.network(
                      item.image,
                      height: 180,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textScaleFactor: 1.2,
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                        child: Text(
                          item.desc,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textScaleFactor: 1.5,
                        ),
                      )),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using, making it look like readable English. Many desktop publishing packages and web page editors ',
                              style: TextStyle(
                                color: Colors.white70,
                                fontFamily: GoogleFonts.abel().toString(),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
