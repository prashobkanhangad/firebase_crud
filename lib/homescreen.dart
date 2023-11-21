import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/constants/colors.dart';
import 'package:firebase_crud/datascreen.dart';
import 'package:firebase_crud/model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController nametextController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Write',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kprimarycolor,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
                decoration: textdecoration(Icons.abc, 'Name'),
                controller: nametextController),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration:
                    textdecoration(Icons.mobile_off_rounded, 'Mobile Number'),
                controller: mobileController),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: textdecoration(Icons.ac_unit_sharp, 'Age'),
              controller: ageController,
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                  style: elevatebuttonstyleprimary,
                  onPressed: () {
                    submit(
                        nametextController.text,
                        int.parse(ageController.text),
                        int.parse(mobileController.text));
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                  style: elevatebuttonstyleprimary,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DataScreen(),
                    ));
                  },
                  child: Text(
                    'View Data',
                    style: TextStyle(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration textdecoration(IconData icon, String hintText) {
    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13.0,
          horizontal: 10.0,
        ),
        prefixIcon: Icon(icon, color: kprimarycolor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: kprimarycolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: kprimarycolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: kprimarycolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        labelStyle: TextStyle(fontSize: 12, color: kprimarycolor),
        errorStyle: TextStyle(fontSize: 12, color: kprimarycolor),
        hintText: hintText,
        hintStyle:
            TextStyle(fontSize: 15, color: kprimarycolor.withOpacity(0.8)));
  }

  submit(String name, int age, int mobile) async {
    DocumentReference documnetReference =
        FirebaseFirestore.instance.collection('Users').doc();

    BoolsModel userData = BoolsModel(
        name: name,
        age: age,
        mobile: mobile,
        documentUid: documnetReference.id);

    await documnetReference.set(userData.toJson());
  }
}
