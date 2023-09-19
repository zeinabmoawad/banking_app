import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/home_page.dart';
import './Screens/view_all_customers.dart';
import './Screens/profile.dart';
import 'Screens/amount_money_transfer.dart';
import './Screens/select_customer_to_tarnsfer.dart';
import './Providers/users.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [          
          ChangeNotifierProvider.value(value: Users()),
],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          ViewAllCustomers.routeName: (context) => const ViewAllCustomers(),
          Profile.routeName: (context) => const Profile(),
          AmountMoneyTransfer.routeName:(context) => const AmountMoneyTransfer(),
          SelectCustomerToTranfer.routeName:(context)=>const SelectCustomerToTranfer(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily:'Caveat'
                ),
        home: const HomePage(),
      ),
    );
  }
}
