import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/widgets/snac_bar.dart';
import 'register_states.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterCubit extends Cubit <RegisterStates>{
  RegisterCubit() : super(InitialLoginState());
  static RegisterCubit get(context) => BlocProvider.of(context);
/////////////////////////////////////////////////////////////////////////////////////////// upload image
  File? file;
  var imagePicker = ImagePicker();
  String? url;
  uploadImage() async {
    emit(UploadImageRegisterLoading());
    try {
      XFile? imgPicked = await imagePicker.pickImage(source: ImageSource.gallery);
      var nameImage = basename(imgPicked!.path);
      if (imgPicked != null) {
        file = File(imgPicked.path);
      }
      emit(UploadImageRegisterSuccess());
    } catch (e) {
      debugPrint('error is $e');
      emit(UploadImageRegisterError());
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////// register
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredentialRegister;
  createUser(String email, password , BuildContext context) async {
    emit(RegisterLoading());
    userCredentialRegister = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      emit(RegisterSuccess());
    }).catchError((e){
      emit(RegisterError(e.toString()));
    });
  }
/////////////////////////////////////////////////////////////////////////////////////////// login
  UserCredential? userCredentialLogin;
  loginUser( String email, String password, BuildContext context ) async {
    emit(LoginLoading());
    userCredentialLogin = await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value){
      defaultSnackBar(text: 'Login Successfully' , context: context , color: Colors.green);
      emit(LoginSuccess());
    }).catchError((error){
      defaultSnackBar(text: error.toString(), context: context,color: Colors.red);
      emit(LoginError(e.toString())
      );
    });
  }
///////////////////////////////////////////////////////////////////////////////////////////

}