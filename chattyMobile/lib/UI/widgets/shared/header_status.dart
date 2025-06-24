/*import 'package:flutter/material.dart';
import 'package:hello_world/UI/widgets/home/profile_image.dart';
import 'package:intl/intl.dart';

class HeaderStatus extends StatelessWidget {
  final String username;
  final String imageUrl;
  final bool online;
  final DateTime? lastSeen;
  final bool? typing;

  const HeaderStatus(this.username, this.imageUrl, this.online,
      {this.lastSeen, this.typing});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        child: Row(
          children: [
            ProfileImage(
              imageUrl: imageUrl,
              online: online,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    username.trim(),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: typing == null
                  ? Text(
                      online
                          ? "online"
                          : 'last seen at ${DateFormat.yMd().add_jm().format}',
                      style: Theme.of(context).textTheme.caption,
                    )
                  : Text(
                      'typing..',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
            ),
          ],
        ));
  }
}*/
