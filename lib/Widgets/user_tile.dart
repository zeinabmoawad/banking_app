import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/user_information.dart';
import '../Providers/users.dart';
class UserTile extends StatelessWidget {
  UserInformation userinfo;
  final String userName_from;
  final double amount;
  UserTile({
    super.key,
    required this.userinfo,
    required this.userName_from,
    required this.amount,
  });
  Future<void> _transferMoney(BuildContext context, String userName_from,
      String UserName_To, double amount) async {
    await Provider.of<Users>(context, listen: false)
        .transferMoneyToUser(userName_from, UserName_To, amount);
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: ClipOval(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.network(
              userinfo.profilePhoto,
            ),
          ),
        ),
        title: Text(
          userinfo.name,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100),
        ),
        onTap: () {
          _transferMoney(context, userName_from, userinfo.userName, amount);
          Navigator.pushReplacementNamed(
            context,
            '/viewallcustomers',
          );
        });
  }
}
