import 'package:flutter/material.dart';
import 'package:pagination_app/homepage.dart';
import 'package:pagination_app/http.dart';
import 'package:pagination_app/paginated_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ApiCall();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePageScreen(),
      ),
    );
  }
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return HomePage();
                }));
              },
              child: Text('Paginated search bar'),
            ),
            MaterialButton(
              color: Colors.purpleAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return PaginatedScreen(title:'Paginated app bar');
                }));
              
              },
              child: Text('custom pagination'),
            ),
          ],
        ),
      ),
    );
  }
}
