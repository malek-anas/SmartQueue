import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'serves_state.dart';

class ServesCubit extends Cubit<ServesState> {
  ServesCubit() : super(ServesInitial());
}
