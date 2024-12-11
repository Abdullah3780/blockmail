import 'package:blockmail/home.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false,
      
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome Text
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Google and Facebook Login

                SizedBox(
                  width: double.infinity,
                  child: _socialLoginButton(
                    "Sign in with Google",
                    Colors.blue,
                    MdiIcons.google,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: _socialLoginButton(
                    "Sign in with Facebook",
                    Colors.blue[900]!,
                    MdiIcons.facebook,
                  ),
                ),

                const SizedBox(height: 20),

                // OR Divider
                const Text(
                  "OR",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Username and Password Login
                _textInputField("Username"),
                const SizedBox(height: 10),
                _textInputField("Password", isPassword: true),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Login with Username",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                // OR Divider
                const Text(
                  "OR",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Crypto Wallet Connections
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _walletButton("Internet Identity", Icons.account_circle),
                      const SizedBox(width: 10),
                      _walletButton("MetaMask", Icons.wallet),
                      const SizedBox(width: 10),
                      _walletButton("Phantom", Icons.phonelink),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButton(String text, Color color, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(150, 50),
      ),
    );
  }

  Widget _textInputField(String hintText, {bool isPassword = false}) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _walletButton(String text, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        // connectMetaMask();
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[800],
        minimumSize: const Size(120, 50),
      ),
    );
  }
}

// Future<void> connectMetaMask() async {
//   final client = Web3Client(
//       'https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID', Client());
//   client.getClientVersion();
//   print("MetaMask Connected to Ethereum Network");
//   // Wallet interaction can be implemented here.
// }
