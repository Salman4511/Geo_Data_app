// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geo_data_app/shared/widgets/footer_widget.dart';
// import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

// class UserDashboardScreen extends StatelessWidget {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   UserDashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: NavbarWidget(),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('locations').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No locations available'));
//           }

//           final documents = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: documents.length,
//             itemBuilder: (context, index) {
//               final doc = documents[index];
//               return ListTile(
//                 title: Text(
//                     '${doc['city']}, ${doc['district']}, ${doc['state']}, ${doc['country']}'),
//               );
//             },
//           );
//         },
//       ),
//       // bottomNavigationBar: const FooterWidget()
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geo_data_app/routes/app_routes.dart';
import 'package:geo_data_app/shared/widgets/navbar_widget.dart';

class UserDashboardScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarWidget(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('locations').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No locations available'));
                }

                final documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final doc = documents[index];
                    return ListTile(
                      title: Text(
                          '${doc['city']}, ${doc['district']}, ${doc['state']}, ${doc['country']}'),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.uploadExcel);
                  },
                  child: const Text('Upload Excel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.weatherReport);
                  },
                  child: const Text('View Weather Report'),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const FooterWidget(), // Uncomment if using footer
    );
  }
}
