import 'package:flutter/material.dart';

class AmountMoneyTransfer extends StatefulWidget {
  static String routeName = '/tranferMoneyTo';

  const AmountMoneyTransfer({super.key});

  @override
  State<AmountMoneyTransfer> createState() => _AmountMoneyTransferState();
}

class _AmountMoneyTransferState extends State<AmountMoneyTransfer> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Money Transfer",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            
            image: AssetImage("assets/images/sky.jpg"),
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 10,
                )
              ],
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Dear  ${args['name']} ,'),
              const Text(
                  'Please enter amount of money that you want to tranfer'),
              Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: TextField(
                    controller: myController,
                  )),
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // background color
                foregroundColor: Colors.white, // text color
              ),
              onPressed: () => Navigator.pushReplacementNamed(
                  context, '/SelectCustomerToTranfer', arguments: {
                'userName': args['userName'],
                'amount': myController.text!=''?myController.text:'0'
                
              }),
              child: const Text(
                'Select Customer to transfer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
