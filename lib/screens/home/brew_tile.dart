import 'package:crypt/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onLongPress: () {
                            Clipboard.setData(
                              new ClipboardData(text: brew.pass),
                            );
                            final snackBar = SnackBar(
                              content: Text('Password or link Copied'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {},
                              ),
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                          },
            // leading: CircleAvatar(
            //   radius: 25.0,
            //   backgroundColor: Colors.brown[brew.strength],
            //   backgroundImage: AssetImage('assets/images/coffee.png'),
            // ),
            title: Text('Subscription: ${brew.name}         '),
            subtitle: Text('User Id: ${brew.userid}'),
          ),
      ),
    );
  }
}
