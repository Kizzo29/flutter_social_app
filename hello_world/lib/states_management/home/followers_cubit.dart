import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';

class FollowersCubit extends Cubit<List<User>> {
  final UserService _userService;
  FollowersCubit(this._userService) : super([]);

  Future<void> followers(String id) async {
    final followers = await _userService.fetchFollowers(userId: id);
    emit(followers);
  }
}
