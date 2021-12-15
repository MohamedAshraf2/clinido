import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:clinido/screens/splash_screen.dart';
import 'package:clinido/screens/welcome_screen.dart';
import 'package:clinido/screens/authontication/login_screen.dart';
import 'package:clinido/screens/authontication/registration_screen.dart';
import 'package:clinido/screens/home_screen.dart';
import 'package:clinido/screens/specialities_screen.dart';
import 'package:clinido/screens/speciality_doctors_screen.dart';
import 'package:clinido/screens/confirm_reservation_screen.dart';
import 'package:provider/provider.dart';
import 'package:clinido/providers/doctors_data.dart';
import 'package:clinido/providers/user_data.dart';
import 'package:clinido/models/fire_user.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

Stream<DoctorsData> doctorsStream =
    FirebaseFirestore.instance.collection('Doctor').snapshots().map((snapshot) {
  DoctorsData dd = DoctorsData();
  for (var doc in snapshot.docs) {
    dd.addDoctor(doc.data());
  }
  return dd;
});

Stream<UserData> userStream =
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) {
  UserData ud = UserData();
  snapshot.docs.forEach((doc) {
    if (FirebaseAuth.instance.currentUser != null) {
      if (doc.id == FirebaseAuth.instance.currentUser.uid) {
        ud.fireUser = FireUser.fromJson(doc.data());
      }
    }
  });
  return ud;
});

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<UserData>.value(
              value: userStream, initialData: UserData()),
          StreamProvider<DoctorsData>.value(
              value: doctorsStream, initialData: DoctorsData()),
        ],
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.lightBlue),
          home: SplashScreen(),
          // home: WelcomeScreen(),
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.id,
          // initialRoute: WelcomeScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            WelcomeScreen.id: (context) => WelcomeScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            RegistrationScreen.id: (context) => RegistrationScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            SpecialitiesScreen.id: (context) => SpecialitiesScreen(),
            SpecialityDoctorsScreen.id: (context) =>
                SpecialityDoctorsScreen(screenTitle: ''),
            ConfirmScreen.id: (context) => ConfirmScreen(),
          },
        ));
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Icon(Icons.error), Text("something went wrong !")],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
