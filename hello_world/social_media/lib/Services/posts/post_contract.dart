import 'package:flutter/cupertino.dart';
import 'package:social_media/Models/comment.dart';
import 'package:social_media/Models/post.dart';
import 'package:social_media/Models/user.dart';

abstract class IPostService {
  Future<Post> send(List<Post> post);
  Stream<Post> receive({required User me});
  Future<List<Post>> fetch({required String userId, Post? post});
  Future<void> like(Post post, String myId);
  Future<List<Post>> getAllPosts(String myId);

  dispose();
}
