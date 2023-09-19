import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CustomImageHolder extends StatefulWidget {
  const CustomImageHolder(
      {super.key,
      required this.customHeight,
      required this.customWidth,
      required this.customURL});
  final int customWidth;
  final int customHeight;
  final String customURL;
  @override
  State<CustomImageHolder> createState() => _CustomImageHolderState();
}

class _CustomImageHolderState extends State<CustomImageHolder> {
  String imageURL =
      "https://drive.google.com/uc?export=download&id=1XNOVj73YECeHQGocFrTO-Kgb2TR42qS3";
  Future<void> getDownloadURL(imgPath) async {
    final storageRef = FirebaseStorage.instance.ref();
    final ref = storageRef.child(imgPath);
    String url = await ref.getDownloadURL();

    setState(() {
      imageURL = url;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDownloadURL(widget.customURL);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.customWidth / widget.customHeight,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.grey),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Image.network(
            imageURL,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
