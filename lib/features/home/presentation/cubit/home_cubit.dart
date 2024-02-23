import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_states.dart';

class HomeCubit extends Cubit <HomeStates>{
  HomeCubit (): super (InitialHomeState ());
  static HomeCubit get(context) => BlocProvider.of(context);
/////////////////////////////////////////////////////////////////// please insert this line after every method

}