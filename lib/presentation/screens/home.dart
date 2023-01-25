import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/data/models/user_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ]),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          final users = value.users.data;
          return ListView.separated(
              itemBuilder: (context, index) => userItem(users[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: users!.length);
        },
      ),
    );
  }

  Widget userItem(Data user) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Image.network(
            user.avatar!,
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${user.firstName} ${user.lastName}"),
              Text('${user.email}')
            ],
          )
        ],
      ),
    );
  }
}
