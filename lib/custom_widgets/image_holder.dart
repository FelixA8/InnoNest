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
  String imageURL = "https://via.placeholder.com/1600x900";
  String augmentedURL =
      "https://modelviewer.dev/shared-assets/models/Astronaut.usdz";
  final storageRef = FirebaseStorage.instance.ref();

  Future<void> getURL(imgPath) async {
    final ref = storageRef.child(imgPath);
    String url = await ref.getDownloadURL();
    imageURL = url;
    setState(() {});
  }

  Future<void> getArURL(arPath) async {
    final ref = storageRef.child(arPath);
    String url = await ref.getDownloadURL();
    setState(() {
      augmentedURL = url;
    });
  }

  @override
  void initState() {
    super.initState();
    getURL(widget.customURL);
    widget.showAR ? getArURL(widget.arURL) : null;
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
        decoration: widget.showAR
            ? BoxDecoration(
                image: DecorationImage(image: NetworkImage(imageURL)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.grey)
            : const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.grey),
        child: widget.showAR
            ? ModelViewer(
                src: augmentedURL,
                ar: true,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageURL,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
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
