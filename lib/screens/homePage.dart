import 'package:flutter/material.dart';
import 'package:quates_app/helper/dh_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future getData;

  @override
  void initState() {
    super.initState();
    getData = DBHelper.dbHelper.initDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          size: 35,
          color: Colors.black,
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 35,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: GridView(
              children: ,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
            ),
          ),
        ],
      ),
    );
  }
}
