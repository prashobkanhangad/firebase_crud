import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/constants/colors.dart';
import 'package:firebase_crud/model.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Data Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kprimarycolor,
      ),
      body: SafeArea(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Users').snapshots(),
              builder: (context, snapshot) {
                return ListView.separated(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    final boolsModel =
                        BoolsModel.fromJson(snapshot.data!.docs[index]);
                    return Container(
                      padding: const EdgeInsets.all(5),
                      // height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${boolsModel.name} , ${boolsModel.age}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(boolsModel.mobile.toString()),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(boolsModel.documentUid)
                                    .delete();
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: snapshot.data!.size,
                );
              })),
    );
  }
}
