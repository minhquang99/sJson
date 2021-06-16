import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchjson/network.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API'),
      ),
      body: Container(
        child: FutureBuilder(
            future: fetchChamp(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data[index].avatar),
                        ),
                        title: Text(snapshot.data[index].id),
                        subtitle: Text(snapshot.data[index].bundle),
                      );
                    });
              } else if (snapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text('Error'),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
