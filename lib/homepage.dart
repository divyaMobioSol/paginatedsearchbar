import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_app/http.dart';
import 'package:pagination_app/model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ApiCall apiCall;

  @override
  void initState() {
    apiCall = context.read<ApiCall>();
    apiCall.getUsers();
    super.initState();
  }

  final controller = TextEditingController();
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination with search bar'),
      ),
      body: Consumer<ApiCall>(
          builder: (BuildContext context, value, Widget? child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Enter Text'),
                onChanged: value.onSearch,
              ),
              SizedBox(
                height: 600,
                child: ListView.builder(
                    itemCount: value.searchUsers.length,
                    itemBuilder: ((context, index) {
                      final Datum datum = value.searchUsers.elementAt(index);
                      // print('user......${users[index].data[index].email}');
                      return ListTile(
                        title: Text(datum.firstName),
                        subtitle: Text(datum.email),
                      );
                    })),
              ),
            ],
          ),
        );
      }),
    );
  }
}
