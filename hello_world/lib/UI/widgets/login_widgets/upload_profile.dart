import 'package:flutter/material.dart';

class UploadProfile extends StatelessWidget {
  const UploadProfile();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126.0,
      width: 126.0,
      child: Material(
        borderRadius: BorderRadius.circular(126.0),
        elevation: 3,
        shadowColor: Color(0xFFDEF5FC),
        color: Colors.grey[50],
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(126.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child:
                    Icon(Icons.person, size: 126.0, color: Color(0xFF011A43)),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: Color(0xFF011A43),
                    size: 29.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
