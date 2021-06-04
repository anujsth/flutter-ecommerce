import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/cupertino/icons.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountEmail: Text('Anuj@god.com'),
                  accountName: Text('Anuj Shrestha'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/samurai.jpg'),
                  )),
            ),
            ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.white),
                title: Text(
                  'Home',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            ListTile(
                leading:
                    Icon(CupertinoIcons.profile_circled, color: Colors.white),
                title: Text(
                  'Profile',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            ListTile(
                leading: Icon(CupertinoIcons.mail, color: Colors.white),
                title: Text(
                  'Mail',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
