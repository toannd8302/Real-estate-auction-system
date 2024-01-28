import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:real_estate_auction_system/core/constants/demension_constatnt.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = "/profile";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

String? _userName;
String? _userAvatarUrl;
String? _userEmail;

class _ProfileScreenState extends State<ProfileScreen> {
  String imagePath = "assets/images/Avartar.png";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LineAwesomeIcons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Thông tin cá nhân"),
        actions: [
          IconButton(
            icon: const Icon(LineAwesomeIcons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              //Avartar
              SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      child: ClipRRect(
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -16,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(color: Colors.white),
                            ),
                            backgroundColor: Colors.grey[200],
                          ),
                          child: const Icon(
                            LineAwesomeIcons.camera,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //Menu
              ProfileMenuWidget(
                title: "Thông tin cá nhân",
                icon: LineAwesomeIcons.user,
                onPress: () {},
                endIcon: true,
              ),
              ProfileMenuWidget(
                title: "Chính sách",
                icon: LineAwesomeIcons.book,
                onPress: () {},
                endIcon: true,
              ),

              // ProfileMenuWidget(),
              // ProfileMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endIcon,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          color: Colors.blue,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                color: Colors.grey,
                size: 20,
              ),
            )
          : null,
    );
  }
}
  
  
 
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Thông tin cá nhân"),
  //       leading: IconButton(
  //         icon: const Icon(LineAwesomeIcons.arrow_left),
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //       ),
  //       actions: [
  //         IconButton(
  //           icon: const Icon(LineAwesomeIcons.edit),
  //           onPressed: () {},
  //         ),
  //       ],
  //       elevation: 0,
  //     ),
  //     body: ListView(
  //       padding: const EdgeInsets.all(16),
  //       children: <Widget>[
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           decoration: const BoxDecoration(
  //             gradient: LinearGradient(
  //               colors: [Colors.lightGreen, Colors.cyan],
  //               begin: Alignment.topRight,
  //               end: Alignment.topLeft,
  //             ),
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //           ),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Container(
  //                 width: 80,
  //                 height: 80,
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   image: DecorationImage(
  //                     image: _userAvatarUrl != null
  //                         ? NetworkImage(_userAvatarUrl!)
  //                         : const AssetImage("") as ImageProvider<Object>,
  //                   ),
  //                 ),
  //                 child: _userAvatarUrl == null
  //                     ? const Icon(Icons.person, size: 50)
  //                     : null,
  //               ),
  //               const SizedBox(height: 16),
  //               Text(
  //                 _userName ?? 'Loading...',
  //                 style: const TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white),
  //                 textAlign: TextAlign.center,
  //               ),
  //               const SizedBox(height: 16),
  //               Text(
  //                 _userEmail ?? 'Loading...',
  //                 style: const TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.normal,
  //                     color: Colors.white),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 16,
  //           child: Divider(
  //             color: Colors.black45,
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 5),
  //           child: ListTile(
  //             leading: const Icon(
  //               Icons.account_circle_rounded,
  //               size: 30,
  //             ),
  //             title: const Text('Thông tin cá nhân'),
  //             trailing: const Icon(Icons.arrow_forward_ios),
  //             onTap: () {},
  //             iconColor: Colors.white,
  //             textColor: Colors.white,
  //             tileColor: Colors.indigo,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 5),
  //           child: ListTile(
  //             leading: const Icon(
  //               Icons.book,
  //               size: 30,
  //             ),
  //             title: const Text('Chính sách'),
  //             trailing: const Icon(Icons.arrow_forward_ios),
  //             onTap: () {
  //               // Logout functionality
  //               //_googleSignIn.signOut();
  //               Navigator.pushReplacementNamed(context, '/login');
  //             },
  //             iconColor: Colors.white,
  //             textColor: Colors.white,
  //             tileColor: Colors.orangeAccent,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 5),
  //           child: ListTile(
  //             leading: const Icon(
  //               Icons.logout,
  //               size: 30,
  //             ),
  //             title: const Text('Logout'),
  //             trailing: const Icon(Icons.arrow_forward_ios),
  //             onTap: () {
  //               // Logout functionality
  //               //_googleSignIn.signOut();
  //               Navigator.pushReplacementNamed(context, '/login');
  //             },
  //             iconColor: Colors.white,
  //             textColor: Colors.white,
  //             tileColor: Colors.orangeAccent,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 5),
  //           child: ListTile(
  //             leading: const Icon(
  //               Icons.logout,
  //               size: 30,
  //             ),
  //             title: const Text('Logout'),
  //             trailing: const Icon(Icons.arrow_forward_ios),
  //             onTap: () {
  //               // Logout functionality
  //               //_googleSignIn.signOut();
  //               Navigator.pushReplacementNamed(context, '/login');
  //             },
  //             iconColor: Colors.white,
  //             textColor: Colors.white,
  //             tileColor: Colors.orangeAccent,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 5),
  //           child: ListTile(
  //             leading: const Icon(
  //               Icons.logout,
  //               size: 30,
  //             ),
  //             title: const Text('Đăng xuất'),
  //             trailing: const Icon(Icons.arrow_forward_ios),
  //             onTap: () {
  //               // Logout functionality
  //               //_googleSignIn.signOut();
  //               Navigator.pushReplacementNamed(context, '/login');
  //             },
  //             iconColor: Colors.white,
  //             textColor: Colors.white,
  //             tileColor: Colors.orangeAccent,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

