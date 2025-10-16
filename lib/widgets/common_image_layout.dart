import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:calorie_counter/app_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class CommonImageLayout extends StatefulWidget {
  final String? image,assetImage;

  final double? height, width,borderRadius;
  final XFile? file;
  final Uint8List? byte;
  final bool isImage;

  const CommonImageLayout({
    super.key,
    this.image,
    this.assetImage,

    this.height,
    this.width,
    this.file,
    this.isImage = true,
    this.byte,
    this.borderRadius,
  });

  @override
  State<CommonImageLayout> createState() => _CommonImageLayoutState();
}

class _CommonImageLayoutState extends State<CommonImageLayout> {
  @override
  Widget build(BuildContext context) {
    return widget.image != null
        ? CachedNetworkImage(
            imageUrl: widget.image!,
            placeholder: (context, url) => Container(
              height: widget.height ?? (50),
              width: widget.width ?? (50),

              decoration: BoxDecoration(
                color: AppColors.lightPrimaryColor,
                borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
              ),
              child: Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              height: widget.height ?? (50),
              width: widget.width ?? (50),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
                color: AppColors.lightPrimaryColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius?? 12),

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
                    image: DecorationImage(
                      image: AssetImage(AppImages.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              height: widget.height ?? (50),
              width: widget.width ?? (50),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
                color: AppColors.lightPrimaryColor,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          )
        : widget.byte != null
        ? Container(
            height: widget.height ?? (50),
            width: widget.width ?? (50),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
              color: AppColors.lightPrimaryColor,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
                image: DecorationImage(
                  image: MemoryImage(widget.byte!),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
            ),
          )
        : widget.assetImage != null
        ? Container(
          height: widget.height ?? (50),
          width: widget.width ?? (50),
          decoration: BoxDecoration(
            color: AppColors.lightPrimaryColor,

            borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
            image: DecorationImage(
              image: AssetImage(widget.assetImage!),
              fit: BoxFit.cover,
            ),
          ),
        )
        : Container(
            height: widget.height ?? (50),
            width: widget.width ?? (50),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
              color: AppColors.lightPrimaryColor,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius?? 12),
                image: DecorationImage(
                  image: FileImage(File(widget.file!.path)),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
            ),
          );
  }
}
