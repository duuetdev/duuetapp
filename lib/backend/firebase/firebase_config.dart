import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBG4IiBhKnhoAZ_eEU9SUUZ6JsLOxJGeZs",
            authDomain: "duuet-d08ul1.firebaseapp.com",
            projectId: "duuet-d08ul1",
            storageBucket: "duuet-d08ul1.appspot.com",
            messagingSenderId: "1035562816092",
            appId: "1:1035562816092:web:63fb13511f987b69bacc99"));
  } else {
    await Firebase.initializeApp();
  }
}
