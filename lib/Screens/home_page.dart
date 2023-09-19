import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text(
              "HomePage",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: Colors.black,
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, // background color
            foregroundColor: Colors.white, // text color
          ),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/viewallcustomers'),
          child: const Text(
            'Veiw All Customer',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sky.jpg"),
              // fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text("Banking System",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ));
  }
}
