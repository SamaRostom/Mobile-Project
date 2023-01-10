import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/create_room_screen.dart';
import 'package:flutter_application_1/screens/join_room_screen.dart';
import 'package:flutter_application_1/widgets/responsive.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  // static String routeName = '/main-menu';
  const MainMenuScreen({Key? key}) : super(key: key);

  // void createRoom(BuildContext context) {
  //   Navigator.pushNamed(context, CreateRoomScreen.routeName);
  // }

  // void joinRoom(BuildContext context) {
  //   Navigator.pushNamed(context, JoinRoomScreen.routeName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CustomButton(
              // onTap: () => createRoom(context),
              onTap: () {
                Navigator.pushNamed(context, '/create_room_screen');
              },
              text: 'Create Room',
            ),
            const SizedBox(height: 20),
            CustomButton(
              // onTap: () => joinRoom(context),
              onTap: () {
                Navigator.pushNamed(context, '/join_room_screen');
              },
              text: 'Join Room',
            ),
          ],
        ),
      ),
    );
  }
}
