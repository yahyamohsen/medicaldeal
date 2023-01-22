import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Notification/data/models/notification_model.dart';
import 'package:sart_up_project/Features/Notification/presentation/views/notifications_details.dart';
import 'package:sart_up_project/Features/Notification/presentation/views/notifications_view.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

import '../../../../constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class CustomNotificationItem extends StatefulWidget {
  const CustomNotificationItem({
    Key? key,
    required this.notificationModel,
    this.onDelete,
  }) : super(key: key);

  final NotificationModel notificationModel;
  final VoidCallback? onDelete;
  @override
  State<CustomNotificationItem> createState() => _CustomNotificationItemState();
}

class _CustomNotificationItemState extends State<CustomNotificationItem> {
  bool isImageLoaded = true;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .15,
        motion: const ScrollMotion(),
        children: [
          IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => const NotificationsDetails(),
            arguments: widget.notificationModel,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xff707070).withOpacity(.07),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ListTile(
            leading: Container(
              width: 60,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                    '$kImageUrlPath${widget.notificationModel.image}',
                    errorListener: () {
                      isImageLoaded = false;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getLocalizedData(widget.notificationModel.titleEn,
                      widget.notificationModel.title),
                  style: Styles.bodyText2.copyWith(
                    color: const Color(0xff323133),
                    fontSize: 16,
                  ),
                ),
                const SpaceBox(
                  height: 1.5,
                ),
                Text(
                  getLocalizedData(widget.notificationModel.titleEn,
                      widget.notificationModel.title),
                  style: Styles.bodyText1.copyWith(
                    color: Colors.black.withOpacity(.4),
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
