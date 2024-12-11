import 'package:blockmail/compose.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComposeMailPage(),
              ));
        },
        child: const Icon(Icons.edit),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: isSearching
            ? TextField(
                controller: searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search mail',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (value) {
                  // Handle search submission
                  print('Search query: $value');
                },
              )
            : const Text(
                'BlockMail',
              ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear(); // Clear search when closing
                }
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'BlockMail',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Web3 Inbox'),
              onTap: () {
                // Navigate to Web3 Inbox
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail_outline),
              title: const Text('Web2 Inbox'),
              onTap: () {
                // Navigate to Web2 Inbox
              },
            ),
            ListTile(
              leading: const Icon(Icons.send),
              title: const Text('Sent'),
              onTap: () {
                // Navigate to Sent
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Starred'),
              onTap: () {
                // Navigate to Starred
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Spam'),
              onTap: () {
                // Navigate to Spam
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Trash'),
              onTap: () {
                // Navigate to Trash
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile
              },
            ),
          ],
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'No emails in this folder',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
