import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/user_tile.dart';
import  '../Providers/users.dart';

class SelectCustomerToTranfer extends StatelessWidget {
  static String routeName = '/SelectCustomerToTranfer';
  Future<void> _refreshUser(BuildContext context) async {
    await Provider.of<Users>(context, listen: false).fetchAllusers();
    return Future.value();
  }


  const SelectCustomerToTranfer({super.key});

  @override
  Widget build(BuildContext context) {
        final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Select Customer To Tranfer Money',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("assets/images/sky.jpg"),
            ),
          ),
          child: FutureBuilder(
              future: _refreshUser(context),
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      child: Consumer<Users>(
                        builder: (context, userData, _) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                              itemCount: userData.usersinfo.length,
                              itemBuilder: (context, index) =>
                                  Column(children: [
                                UserTile(userinfo: userData.usersinfo[index],userName_from: args['userName'],amount:double.parse( args['amount'])),
                                const Divider(
                                  height: 20,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.white,
                                ),
                              ]),
                            )),
                      ),
                      onRefresh: () => _refreshUser(context))),
        ));
  }
}

