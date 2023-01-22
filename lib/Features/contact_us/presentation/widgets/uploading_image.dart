import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/core/utils/size_config.dart';

import '../../../../generated/l10n.dart';
import '../../../../styles.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({Key? key, required this.onTap, this.image})
      : super(key: key);

  final VoidCallback onTap;

  final File? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).upload_image,
            style: Styles.bodyText2.copyWith(
              color: const Color(0xff323133),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedCrossFade(
            firstChild: const ImagePlaceHolder(),
            secondChild: ImageContainer(
              image: image,
            ),
            crossFadeState: image == null
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          )
        ],
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.defaultSize * 13,
      height: SizeConfig.defaultSize * 14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(240, 240, 240, 1)),
      child: const Center(
        child: Icon(
          Icons.upload,
          size: 26,
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final File? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.defaultSize * 13,
      height: SizeConfig.defaultSize * 14,
      decoration: BoxDecoration(
          image: image != null
              ? DecorationImage(
                  image: FileImage(image!),
                  fit: BoxFit.fill,
                )
              : null,
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(240, 240, 240, 1)),
    );
  }
}
