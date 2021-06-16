import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.directions_car,
                color: Colors.white,
              )),
              Tab(
                  icon: Icon(
                Icons.directions_transit,
                color: Colors.white,
              )),
              Tab(
                  icon: Icon(
                Icons.directions_bike,
                color: Colors.white,
              )),
            ],
            indicatorColor: Color.fromRGBO(253, 204, 102, 1),
            indicatorWeight: 3,
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
