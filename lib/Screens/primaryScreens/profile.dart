// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Firebase Functions/Auth/auth_functions.dart';
import '/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  final User? user = currentuser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Signed In As",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 26,
            ),
            CircleAvatar(
              radius: 40,
              child: CircleAvatar(
                radius: 39.3,
                backgroundColor: c4,
                backgroundImage: NetworkImage(
                  currentuser?.photoURL ??
                      "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-HD-Image.png",
                ),
              ),
            ),
            FittedBox(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 18,
                child: Text(
                  user?.displayName ?? "user1",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Text(
              user?.email ?? "user1",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () {
                Center(
                  child: CircularProgressIndicator(),
                );
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logOut();
              },
              child: Container(
                margin: EdgeInsets.all(18),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      18,
                    ),
                  ),
                  color: btnGr2,
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
