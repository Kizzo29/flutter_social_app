import 'package:social_media/Models/story.dart';
import 'package:social_media/Models/user.dart';

abstract class IStoryService {
  Future<Story> send(List<Story> story);
  Stream<Story> receiving({required User OnlineUser});
  Future<void> addLikes(Story story, String myId);
  Future<void> addViews(Story story, String viewerId);
  Future<List<Story>> getAllStories(String myId);

  dispose();
}
