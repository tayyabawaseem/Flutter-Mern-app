// import 'package:flutter/material.dart';

// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//   String name = '', email = '', password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Name"),
//                 onChanged: (val) => name = val,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Email"),
//                 onChanged: (val) => email = val,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Password"),
//                 obscureText: true,
//                 onChanged: (val) => password = val,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // abhi sirf local state me store ho raha hai
//                   print("Name: $name, Email: $email, Password: $password");
//                 },
//                 child: Text("Register"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
