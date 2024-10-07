import 'package:flutter/material.dart';
import 'package:pulse_care/theme/colors.dart';

enum Status { scheduled, pending, cancel }

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.status});

  final Status status;

  @override
  Widget build(BuildContext context) {
    final textColor = switch (status) {
      Status.scheduled => AppColors.lightGreen,
      Status.pending => AppColors.lightBlue,
      Status.cancel => AppColors.lightred,
    };

    final iconData = switch (status) {
      Status.scheduled => Icons.check,
      Status.pending => Icons.hourglass_empty,
      Status.cancel => Icons.cancel_outlined,
    };

    final backgroundColor = switch (status) {
      Status.scheduled => AppColors.darkGreen,
      Status.pending => AppColors.darkBlue,
      Status.cancel => AppColors.darkRed,
    };

    return Chip(
      side: BorderSide.none,
      avatar: Icon(iconData, color: textColor),
      shape: const StadiumBorder(),
      label: Text(status.name, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
    );
  }
}
