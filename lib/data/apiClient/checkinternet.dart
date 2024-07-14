 import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

checkInternet() async {
  try {
    bool result = await InternetConnectionChecker().hasConnection;
if(result == true) {
  // print('YAY! Free cute dog pics!');
  return true ; 
} else {
 
}

    
  } on SocketException catch(_){
    return false ;
}}