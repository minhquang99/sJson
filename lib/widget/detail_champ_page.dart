import 'dart:io';

import 'package:flutter/material.dart';
import 'package:searchjson/model/champ.dart';
import 'package:searchjson/network.dart';
import 'package:searchjson/widget/homepage.dart';

class DetailChampPage extends StatelessWidget {
  final Champ champ;
  DetailChampPage(this.champ);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff010913),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                champ.name,
                style: TextStyle(
                    fontSize: 19,
                    color: Color(0xfffebbc6f),
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  champ.skill,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xfff121212),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(champ.wallpaper), fit: BoxFit.cover)),
              child: ListTile(
                title: Text(
                  champ.name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfffebbc6f)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
                height: 250,
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      color: Color(0xfff121212),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Kĩ năng',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Image(
                                image: NetworkImage(champ.avatar),
                              ),
                            ),
                          ),
                          Container(
                            width: 350,
                            child: Text(champ.des1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(champ.des2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(champ.des3,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 100,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    color: Color(0xfff121212),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Trang bị thích hợp',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image(
                            height: 60,
                            width: 60,
                            image: NetworkImage(champ.item1),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image(
                            height: 60,
                            width: 60,
                            image: NetworkImage(champ.item2),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image(
                            height: 60,
                            width: 60,
                            image: NetworkImage(champ.item3),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 150,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    color: Color(0xfff121212),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Quảng cáo',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
