import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/data/models/user_model.dart';
import 'package:test_task/presentation/provider/user_provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Back",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Add User',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Full name",
                        border: OutlineInputBorder(),
                      ),
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: "E-mail",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<UserProvider>().createNewUser(
                                user: User(
                                    id: 9,
                                    email: emailController.text,
                                    firstName: nameController.text));
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Add".toUpperCase(),
                            style: const TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
