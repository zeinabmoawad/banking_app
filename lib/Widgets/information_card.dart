import 'package:flutter/material.dart';
class InformationCard extends StatelessWidget {
  final String userName;
  final String email;
  final String phone;
  final double balance;
  const InformationCard(
      {super.key,
      required this.userName,
      required this.email,
      required this.phone,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 0.57,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Card(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            margin: const EdgeInsets.only(bottom: 30, top: 30, left: 10),
            child: Row(
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 10, 44, 72),
                      fontFamily: 'Caveat'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  userName,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 10, 44, 72),
                      fontFamily: 'Caveat'),
                ),
              ],
            ),
          ),
          const Divider(
            height: 20,
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(255, 10, 44, 72),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            margin: const EdgeInsets.only(bottom: 30, top: 30, left: 10),
            child: Row(
              children: [
                const Text(
                  'Email:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 10, 44, 72),
                      fontFamily: 'Caveat'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  email,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 10, 44, 72),
                      fontFamily: 'Caveat'),
                ),
              ],
            ),
          ),
          const Divider(
            height: 20,
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(255, 10, 44, 72),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            margin: const EdgeInsets.only(bottom: 30, top: 30, left: 10),
            child: Row(
              children: [
                const Text(
                  'Phone:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 10, 44, 72),
                      fontFamily: 'Caveat'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  phone,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 10, 44, 72),
                      fontFamily: 'Caveat'),
                ),
              ],
            ),
          ),
          const Divider(
            height: 20,
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(255, 10, 44, 72),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            margin: const EdgeInsets.only(bottom: 30, top: 30, left: 10),
            child: Row(
              children: [
                const Text(
                  'Balance:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 10, 44, 72),
                      fontFamily: 'Caveat'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  balance.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 10, 44, 72),
                      fontFamily: 'Caveat'),
                ),
              ],
            ),
          ),
          const Divider(
            height: 20,
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(255, 10, 44, 72),
          ),
        ]),
      ),
    );
  }
}
