import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';

class FriendsCubit extends Cubit<List<User>> {
  final UserService _userService;
  FriendsCubit(this._userService) : super([]);

  Future<void> friends(String id) async {
   final friends = await _userService.getFriends(id);
    emit(friends);
  }
}
