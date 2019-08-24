import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model.dart';

class ListItemDetailsPage extends StatelessWidget {
  final Item item;
  final int orderNo;
  var _currencyFormatter = NumberFormat("#,###");

  ListItemDetailsPage({Key key, this.item, this.orderNo}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Item Details"),
      ),

      body: _buildBody(),
    );
  }


  Widget _buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(
                    item.largeImageUrl,
                  ),
                  Icon(Icons.new_releases, color: Colors.red,)
                ],
              ),
              Text("${_currencyFormatter.format(item.price)}", style: TextStyle(fontSize: 18, color: Colors.blue),),
              Text("#$orderNo ${item.name}"),
              Text(item.description),
              RaisedButton(
                child: Text("Buy Now"),
                onPressed: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}