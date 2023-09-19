import 'package:flutter/material.dart';
import '../Widgets/information_card.dart';
class Profile extends StatefulWidget {
  static String routeName = '/profile';
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("assets/images/sky.jpg"),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Card(
                  color: Colors.transparent,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Image.network(                          
                            args['profilePhoto'],
                          ),
                        ),
                      ),
                      Text(
                        args['name'],
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Caveat'),
                      ),
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              InformationCard(
                  userName: args['userName'],
                  email: args['email'],
                  phone: args['phone'],
                  balance: args['balance']),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white, // text color
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, '/tranferMoneyTo',
                      arguments: {
                        'userName': args['userName'],
                        'name': args['name'],
                      }),
                  child: const Text(
                    'Transfer Money',
                    style: TextStyle(
                      fontFamily: 'Caveat',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

