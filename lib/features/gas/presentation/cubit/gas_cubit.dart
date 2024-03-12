import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'gas_states.dart';
import 'dart:io';

class GasCubit extends Cubit<GasStates>{
  GasCubit(): super(InitialGasState());
  static GasCubit get(context) => BlocProvider.of(context);
////////////////////////////////////////////////////////////////////////////////
  File? imageId;
  uploadImageId() async {
    final imagePicker = ImagePicker();
    emit(UploadIDImageLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageId = File(pickedImage.path);
        emit(UploadIDImageSuccess());
      }else{
        emit(UploadIDImageError());
      }
    }catch(error){
      emit(UploadIDImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  File? imageContract;
  uploadImageContract() async {
    final imagePicker = ImagePicker();
    emit(UploadContractImageLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageContract = File(pickedImage.path);
        emit(UploadContractImageSuccess());
      }else{
        emit(UploadContractImageError());
      }
    }catch(error){
      emit(UploadContractImageError());
    }
  }
////////////////////////////////////////////////////////////////////////////////
  File? imageReceipt;
  uploadImageReceipt() async {
    final imagePicker = ImagePicker();
    emit(UploadReceiptImageLoading());
    try{
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        imageReceipt = File(pickedImage.path);
        emit(UploadReceiptImageSuccess());
      }else{
        emit(UploadReceiptImageError());
      }
    }catch(error){
      emit(UploadReceiptImageError());
    }
  }
}