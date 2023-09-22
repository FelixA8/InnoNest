import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CustomImageHolder extends StatefulWidget {
  const CustomImageHolder(
      {super.key,
      required this.customHeight,
      required this.customWidth,
      required this.customURL,
      required this.showAR,
      required this.arURL});
  final int customWidth;
  final int customHeight;
  final String customURL;
  final bool showAR;
  final String arURL;
  @override
  State<CustomImageHolder> createState() => _CustomImageHolderState();
}

class _CustomImageHolderState extends State<CustomImageHolder> {
  String imageURL =
      "https://drive.google.com/uc?export=download&id=1XNOVj73YECeHQGocFrTO-Kgb2TR42qS3";
  Future<void> getURL(imgPath) async {
    final storageRef = FirebaseStorage.instance.ref();
    final ref = storageRef.child(imgPath);
    String url = await ref.getDownloadURL();

    setState(() {
      imageURL = url;
    });
  }

  @override
  void initState() {
    super.initState();
    getURL(widget.customURL);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.customWidth / widget.customHeight,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imageURL)),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.grey),
        child: widget.showAR
            ? ModelViewer(
                src: widget.arURL,
                ar: true,
              )
            : Container(),
      ),
    );
  }
}
