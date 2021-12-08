import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:drivers_app/Models/drivers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:drivers_app/Models/allUsers.dart';
import 'package:geolocator/geolocator.dart';

String mapKey = "AIzaSyA_4Tp0KLJHmF23NieDo5O-MT45sckP178";

User? firebaseUser ;

Users? userCurrentInfo;

User? currentfirebaseUser;

StreamSubscription<Position>? homeTabPageStreamSubscription;

StreamSubscription<Position>? rideStreamSubscription;


final assetsAudioPlayer = AssetsAudioPlayer();

late Position currentPosition;

Drivers? driversInformation;
String title = "";
double starCounter= 0.0;

String rideType = "";
