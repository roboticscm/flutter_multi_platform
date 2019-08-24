import 'package:flutter/material.dart';
import '../item/list_item_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: _buildBody(context)
    );
  }


  Widget _buildBody(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Username",
                  prefixIcon: Icon(Icons.account_circle)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock)
              ),
            ),
            RaisedButton(
              child: Text("  L O G I N  "),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                  return ListItemPage();
                }));
              },
            )
          ],
        ),
      ),
    );
  }

}