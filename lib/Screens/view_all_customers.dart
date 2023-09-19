import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/user_information.dart';
import '../Providers/users.dart';
import './profile.dart';
class ViewAllCustomers extends StatelessWidget {
  static String routeName = '/viewallcustomers';
  Future<void> _refreshUser(BuildContext context) async {
    await Provider.of<Users>(context, listen: false).fetchAllusers();
    return Future.value();
  }

  const ViewAllCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'All Customer',
            style: TextStyle(color: Colors.white),
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
                                UserTile(userinfo: userData.usersinfo[index]),
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

class UserTile extends StatelessWidget {
  UserInformation userinfo;
  UserTile({
    super.key,
    required this.userinfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: CircleAvatar(
                      backgroundColor: Colors.white,

          child: Image.network(
            fit: BoxFit.contain,
            userinfo.profilePhoto,
          ),
        ),
      ),
      title: Text(
        userinfo.name,
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100),
      ),
      subtitle: Text(
        userinfo.email,
        style: const TextStyle(
            fontSize: 10, color: Colors.white, fontWeight: FontWeight.w100),
      ),
      trailing: Text(
        userinfo.balance.toString(),
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100),
      ),
      onTap: () =>
          Navigator.pushReplacementNamed(context, '/profile', arguments: {
        'userName': userinfo.userName,
        'profilePhoto': userinfo.profilePhoto,
        'name': userinfo.name,
        'email': userinfo.email,
        'phone': userinfo.userName,
        'balance': userinfo.balance,
      }),
    );
  }
}
