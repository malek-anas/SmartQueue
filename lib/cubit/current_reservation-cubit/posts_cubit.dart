import 'package:bloc/bloc.dart';
import 'package:smartqueue/Models/post.dart';
import 'package:smartqueue/database/current_reservation-data_service/data_service.dart';



class Current_reservation extends Cubit<List<Post>> {
  final dataService = DataService();
  Current_reservation() : super([]);
  void get posts async => emit(await dataService.getPosts());
}
