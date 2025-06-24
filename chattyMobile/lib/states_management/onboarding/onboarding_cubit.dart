import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/cache/local_cache.dart';
import 'package:hello_world/services/image_uploader.dart';
import 'package:social_media/social_media.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final IUserService _userService;
  final ImageUploader _imageUploader;
  final ILocalCache _cache;

  OnboardingCubit(
    this._userService,
    this._imageUploader,
    this._cache,
  ) : super(OnboardingInitial());

  Future<void> connect(String name, String emailAddress, File profileImage) async {
    emit(Loading());
    final url = await _imageUploader.uploadImage(profileImage);
    final user = User(
      username: name,
      photourl: url!,
      active: true,
      lastseen: DateTime.now(),
      friends: [],
      email_address: emailAddress,
    );
    final createdUser = await _userService.connect(user);
    final userJson = {
      'username': createdUser.username,
      'active': true,
      'photo_url': createdUser.photourl,
      'id': createdUser.id
    };
    await _cache.save('USER', userJson);
    emit(OnboardingSuccess(createdUser));
  }
}
