import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  final int selectedIndex;

  const MainLayout({
    super.key,
    required this.body,
    required this.selectedIndex
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return; // No need to reload same page

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/TeamsScreen');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/historyScreen');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Cricket ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'Scorrer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  // fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/notification'),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Get.bottomSheet(
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: SizedBox(
                    height: Get.height * 0.8,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const ListTile(title: Text('Rate App')),
                        const Divider(),
                        ListTile(
                          title: const Text('Match Settings'),
                          subtitle: const Text("Default match settings which will be used if match specific settings are not provided"),
                          onTap: () => Navigator.pushNamed(context, '/settings'),
                        ),
                        const Divider(),
                        const ListTile(title: Text('Remove Ads')),
                        const Divider(),
                        const ListTile(title: Text('Archived Matches')),
                        const Divider(),
                        const ListTile(
                          title: Text('Backup'),
                          subtitle: Text("Backup your Teams, Matches and Career Statistics"),
                        ),
                        const Divider(),
                        const ListTile(title: Text('Credits')),
                        const Divider(),
                        const ListTile(
                          title: Text('Open Source License'),
                          subtitle: Text('License details for open-source software'),
                        ),
                        const Divider(),
                        const ListTile(
                          title: Text('Cricket Scorer Version'),
                          subtitle: Text('Version: 1.0.1'),
                        ),
                      ],
                    ),
                  ),
                ),
                isScrollControlled: true,
              );
            },
          ),
        ],
      ),
      body: body,
      backgroundColor: const Color(0xFFEFEFEF),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket),
            label: 'New Match',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
