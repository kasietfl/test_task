import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/presentation/provider/user_provider.dart';
import 'package:test_task/presentation/screens/add_user.screen.dart';
import 'package:test_task/presentation/screens/user_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
    context.read<UserProvider>().getAllUsers();
    // });
  }

  Future<void> refresh() async {
    context.read<UserProvider>().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('All Users'), centerTitle: true, actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddUserScreen()),
            );
          },
        ),
      ]),
      body: Consumer<UserProvider>(builder: (context, value, child) {
        // if (value.isLoading) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        final users = value.users.data;
        return RefreshIndicator(
          displacement: 80,
          onRefresh: refresh,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: const Color.fromARGB(255, 219, 226, 244),
                    padding: const EdgeInsets.only(right: 16.0),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.delete_sweep_sharp,
                        size: 26,
                        color: Color.fromARGB(255, 57, 59, 139),
                      ),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    context
                        .read<UserProvider>()
                        .deleteUserId(id: users?[index].id ?? 0);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 56,
                        height: 56,
                        child: FutureBuilder(
                          future: DefaultCacheManager()
                              .downloadFile(users?[index].avatar ?? ''),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return snapshot.data != null
                                  ? Image.file(
                                      snapshot.data!.file,
                                    )
                                  : const Image(
                                      image:
                                          AssetImage('assets/profile_pic.png'));
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${users?[index].firstName ?? ""} ${users?[index].lastName ?? ""}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(users?[index].email ?? "")
                        ],
                      ),
                      onTap: () {
                        // context
                        //     .read<UserProvider>()
                        //     .getUserDetail(id: users?[index].id ?? 0);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserScreen(
                                    user: users?[index] ?? User(),
                                  )),
                        );
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: users?.length ?? 0),
        );
      }),
    );
  }
}
