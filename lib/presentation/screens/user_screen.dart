import 'package:flutter/material.dart';
import 'package:test_task/data/models/user_model.dart';

class UserScreen extends StatefulWidget {
  final User user;
  const UserScreen({super.key, required this.user});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.user.firstName ?? ''),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                widget.user.avatar != null
                    ? Image(
                        image: NetworkImage(
                          widget.user.avatar ?? '',
                        ),
                        height: 180,
                      )
                    : Container(),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '${widget.user.firstName ?? ''} ${widget.user.lastName ?? ''}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.email_rounded,
                      color: Colors.blue,
                    ),
                    Text(
                      widget.user.email ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
