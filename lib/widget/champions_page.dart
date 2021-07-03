import 'package:flutter/material.dart';
import 'package:searchjson/model/champ.dart';
import 'package:searchjson/widget/detail_champ_page.dart';

import '../network.dart';

class ChampionsPage extends StatefulWidget {
  const ChampionsPage({Key? key}) : super(key: key);

  @override
  _ChampionsPageState createState() => _ChampionsPageState();
}

class _ChampionsPageState extends State<ChampionsPage> {
  List<Champ> _champ = [];
  List<Champ> _champDisplay = [];
  @override
  initState() {
    // at the beginning, all users are shown
    fetchChamp().then((value) {
      setState(() {
        _champ.addAll(value);
        _champDisplay = _champ;
      });
    });
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Champ> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _champ;
    } else {
      results = _champ.where((champ) {
        enteredKeyword = enteredKeyword.toLowerCase();
        var champName = champ.name.toLowerCase();
        return champName.contains(enteredKeyword.toLowerCase());
      }).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _champDisplay = results;
    });
  }

  void _searchWithCost() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff010913),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xfff121212),
          title: Text('Quân Tướng',
              style: TextStyle(fontSize: 17, color: Color(0xfffebbc6f))),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              style: TextStyle(fontSize: 13, color: Color(0xfffebbc6f)),
              decoration: InputDecoration(
                labelText: 'Tìm quân tướng...',
                labelStyle: TextStyle(fontSize: 13, color: Color(0xfffebbc6f)),
                prefixIcon: Container(
                  height: 10,
                  width: 10,
                  child: Icon(
                    Icons.search,
                    color: Color(0xfffebbc6f),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff977648), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              onChanged: (value) => _runFilter(value),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              height: 620,
              child: _champDisplay.length > 0
                  ? GridView.builder(
                      scrollDirection: Axis.vertical,
                      //scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, mainAxisSpacing: 5),
                      itemCount: _champDisplay.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 13,
                                    child: InkWell(
                                      onTap: () {
                                        showGeneralDialog(
                                          barrierLabel: "Label",
                                          barrierDismissible: true,
                                          barrierColor:
                                              Colors.black.withOpacity(0.5),
                                          transitionDuration:
                                              Duration(milliseconds: 700),
                                          context: context,
                                          pageBuilder: (context, anim1, anim2) {
                                            return SafeArea(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  height: 150,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 20),
                                                        child: Container(
                                                          height: 40,
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            20),
                                                                child: Text(
                                                                  _champDisplay[
                                                                          index]
                                                                      .name,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              Text(
                                                                  _champDisplay[
                                                                          index]
                                                                      .cost
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style: TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      fontSize:
                                                                          17,
                                                                      color: Colors
                                                                          .white)),
                                                              Image(
                                                                height: 30,
                                                                width: 30,
                                                                image: AssetImage(
                                                                    'assets/images/icon/gold1.png'),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 20),
                                                        child: Container(
                                                          height: 70,
                                                          child: Row(
                                                            children: [
                                                              Image(
                                                                  image: NetworkImage(
                                                                      _champDisplay[
                                                                              index]
                                                                          .avatar)),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: Text(
                                                                  _champDisplay[
                                                                          index]
                                                                      .origins
                                                                      .join(
                                                                          "\n"),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 20),
                                                        child: Container(
                                                          height: 40,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Items: ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                //width: 300,
                                                                child: Row(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)),
                                                                      child:
                                                                          Image(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        image: NetworkImage(
                                                                            _champDisplay[index].item1),
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)),
                                                                      child:
                                                                          Image(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        image: NetworkImage(
                                                                            _champDisplay[index].item2),
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)),
                                                                      child:
                                                                          Image(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        image: NetworkImage(
                                                                            _champDisplay[index].item3),
                                                                      ),
                                                                    ),
                                                                    FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            new MaterialPageRoute(builder: (context) => DetailChampPage(_champDisplay[index])));
                                                                      },
                                                                      child: Text(
                                                                          "Xem chi tiết",
                                                                          style: TextStyle(
                                                                              decoration: TextDecoration.none,
                                                                              fontSize: 13,
                                                                              color: Color(0xfffebbc6f))),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      bottom: 50,
                                                      left: 12,
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff121212),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          transitionBuilder:
                                              (context, anim1, anim2, child) {
                                            return SlideTransition(
                                              position: Tween(
                                                      begin: Offset(0, 1),
                                                      end: Offset(0, 0))
                                                  .animate(anim1),
                                              child: child,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            //shape: BoxShape.circle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                width: 1.5,
                                                color: _champDisplay[index]
                                                            .cost ==
                                                        5
                                                    ? Colors.yellow
                                                    : _champDisplay[index]
                                                                .cost ==
                                                            4
                                                        ? Colors.purple
                                                        : _champDisplay[index]
                                                                    .cost ==
                                                                3
                                                            ? Colors.blue
                                                            : _champDisplay[index]
                                                                        .cost ==
                                                                    2
                                                                ? Colors.green
                                                                : Colors.grey)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Image(
                                              image: NetworkImage(
                                                  _champDisplay[index].avatar)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      _champDisplay[index].name,
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      })
                  : Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
