import 'package:flutter/material.dart';

const kprimarycolor = Color.fromARGB(255, 11, 32, 51);


final elevatebuttonstyleprimary = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: kprimarycolor,
    foregroundColor: Colors.white);