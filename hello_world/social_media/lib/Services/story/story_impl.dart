import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:social_media/Models/story.dart';
import 'package:social_media/Models/user.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:social_media/Services/story/story_contract.dart';

class StoryService implements IStoryService {
  Connection _connection;
  RethinkDb r;

  final _controller = StreamController<Story>.broadcast();
  StreamSubscription? _changestream;

  StoryService(this._connection, this.r);

  @override
  dispose() {
    _changestream?.cancel();
    _controller.close();
  }

  @override
  Future<Story> send(List<Story> stories) async {
    var data = stories.map((e) => e.toJson()).toList();
    Map record = await r
        .table('stories')
        .insert(data, {'return_data': true}).run(_connection);
    return Story.fromJson(record['changes'].first['new_val']);
  }

  @override
  Stream<Story> receiving({@required User? OnlineUser}) {
    _startReceivingUpdates(OnlineUser!);
    return _controller.stream;
  }

  _startReceivingUpdates(User user) {
    _changestream = r
        .table('stories')
        .filter({'to': user.id})
        .changes({'include_initial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                if (feedData['new_val'] == null) return;

                final story = _storyFromFeed(feedData);
                _controller.sink.add(story);
                _removeDeliverredStory(story);
              })
              .catchError((err) => print(err))
              .onError((error, stackTrace) => print(error));
        });
  }

  Story _storyFromFeed(feedData) {
    var data = feedData(['new_val']);
    return Story.fromJson(data);
  }

  _removeDeliverredStory(story) {
    r
        .table('stories')
        .get(story.id)
        .delete({'return_changes': false}).run(_connection);
  }

  @override
  Future<void> addLikes(Story story, String myId) async {
    await r.table('stories').filter({'id': story.id}).update(
        {'likes': story.likes.add(myId)}).run(_connection);
  }

  @override
  Future<void> addViews(Story story, String viewerId) async {
    await r.table('stories').filter({'id': story.id}).update(
        {'views': story.views.add(viewerId)}).run(_connection);
  }

  @override
  Future<List<Story>> getAllStories(String UserId) async {
    Cursor myStories = await r
        .table('stories')
        .filter({'to': UserId})
        .orderBy(r.desc('time_record'))
        .run(_connection);
    List myStoryList = await myStories.toList();
    return myStoryList.map((e) => Story.fromJson(e)).toList();
  }
}
