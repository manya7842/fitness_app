import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.055,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile4.jpg'),
                ),
                const RotatedBox(
                  quarterTurns: 1,
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                Container(
                  height: 90,
                  width: 130,
                  padding: const EdgeInsets.all(10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joined',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'June 2024',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Peter \nRamsay',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildDivider(),
            IconRow(
              text: 'Account',
              onTap: () {
                // Navigator.pushNamed(context, '/account');
              },
            ),
            const SizedBox(
              height: 8,
            ),
            _buildDivider(),
            const SizedBox(
              height: 8,
            ),
            IconRow(
              text: 'Privacy Policy',
              onTap: () {
                Navigator.pushNamed(context, '/privacyPolicy');
              },
            ),
            const SizedBox(
              height: 8,
            ),
            _buildDivider(),
            const SizedBox(
              height: 8,
            ),
            IconRow(
              text: 'Settings',
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const SizedBox(
              height: 8,
            ),
            _buildDivider(),
            const SizedBox(
              height: 20,
            ),
            _buildDivider(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.shade200.withOpacity(0.15),
      thickness: 1,
      height: 16,
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
