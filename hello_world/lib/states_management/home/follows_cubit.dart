import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';

class FollowsCubit extends Cubit<List<User>> {
  final UserService _userService;
  FollowsCubit(this._userService) : super([]);

  Future<void> follows(String id) async {
   final follows = await _userService.fetchFollows(userId: id);
    emit(follows);
  }
}