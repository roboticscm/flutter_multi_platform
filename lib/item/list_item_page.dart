import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'details/list_item_details_page.dart';
import 'item_repo.dart';
import 'model.dart';

class ListItemPage extends StatefulWidget {
  @override
  _ListItemPageState createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  ItemRepo _itemRepo = ItemRepo();
  var _currencyFormatter = NumberFormat("#,###");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<ListItem>(
      stream: _itemRepo.get(),
      builder: (BuildContext context, AsyncSnapshot<ListItem> snapshot){
        if (snapshot.hasError)
          return _buildError(snapshot.error.toString());
        else if (snapshot.hasData)
          return _buildGridView(snapshot.data);
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(error),
          RaisedButton(
            child: Text("Retry"),
            onPressed: () {
              setState(() {
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildGridView(ListItem listItem) {
    if (listItem.listItem.length == 0)
      return Center(child: Text("No data found"),);
    else {
      return GridView.count(
        crossAxisCount: (MediaQuery.of(context).size.width/160).floor(),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.9,
        children: <Widget>[
          for (var i = 0 ; i < listItem.listItem.length; i++)
            _buildGridItem(listItem.listItem[i], i+1)
        ],
      );
    }
  }

  Widget _buildGridItem(Item item, int orderNo) {
    return InkWell(
      onTap: (){
        _showItemDetails(item, orderNo);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),

        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  item.thumbImageUrl,
                  height: 80,
                ),
                Icon(Icons.new_releases, color: Colors.red,)
              ],
            ),
            Text("${_currencyFormatter.format(item.price)}", style: TextStyle(fontSize: 18, color: Colors.blue),),
            Text("#$orderNo ${item.name}"),
            RaisedButton(
              child: Text("Buy Now"),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }

  _showItemDetails(Item item, int orderNo) {
    Navigator.push(context, MaterialPageRoute(builder: (_){
      return ListItemDetailsPage(
        item: item,
        orderNo: orderNo
      );
    }));
  }
}