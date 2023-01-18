import 'package:apis_getx_app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './models/user_model.dart';

class UserDetailListScreen extends StatefulWidget {
  const UserDetailListScreen({super.key});

  @override
  State<UserDetailListScreen> createState() => _UserDetailListScreenState();
}

class _UserDetailListScreenState extends State<UserDetailListScreen> {
  bool isLoading = true;
  List<User> users = [];
  int limit = 10;
  ScrollController? scrollController;

  _scrollListener() async {
    limit += 10;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(minutes: 1),
      content: Row(
        children: [
          const CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          const Text('Loading', style: TextStyle(color: Colors.white)),
        ],
      ),
      backgroundColor: Colors.blue,
    ));
    await getUsers();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // }
  }

  getUsers() async {
    users = await UserController().getUsers(limit: limit);
    setState(() {
      isLoading = false;
    });
  }

  buildChildren() {
    List<Widget> children = [];
    children.add(SizedBox(height: 10.h));
    for (var i = 0; i < users.length; i++) {
      children.add(ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(users[i].picture.toString()),
        ),
        title: Text(users[i].firstName.toString()),
        subtitle: Text(users[i].title.toString()),
      ));
    }
    return ListView(
      children: children,
    );
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: _scrollListener, icon: const Icon(Icons.arrow_downward)),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : buildChildren(),
    );
  }
}
