import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';

class StoryLineCubit extends Cubit<List<Story>> {
  final StoryService _storyService;
  StoryLineCubit(this._storyService) : super([]);

  Future<void> stories(String UserId) async {
    final stories = await _storyService.getAllStories(UserId);
    emit(stories);
  }
}
