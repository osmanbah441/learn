import 'package:flutter/material.dart';

import '../models/models.dart';

class LabRequestStatusChip extends StatelessWidget {
  const LabRequestStatusChip(
      {super.key, required this.status, this.onlyIcon = false});

  final LabRequestStatus status;
  final bool onlyIcon;

  @override
  Widget build(BuildContext context) {
    return onlyIcon
        ? status.icon
        : Chip(
            side: BorderSide.none,
            avatar: status.icon,
            shape: const StadiumBorder(),
            label: Text(
              status.name,
              style: TextStyle(color: status.textColor),
            ),
            backgroundColor: status.backgroundColor,
          );
  }
}

extension on LabRequestStatus {
  Color get textColor => switch (this) {
        LabRequestStatus.processing => const Color(0xFFA2AE24),
        LabRequestStatus.pending => const Color(0xFF79B5EC),
        LabRequestStatus.cancelled => const Color(0xFFF37877),
        LabRequestStatus.completed => const Color(0xFF24AE7C),
      };

  Icon get icon {
    final iconData = switch (this) {
      LabRequestStatus.processing => Icons.edit_calendar_outlined,
      LabRequestStatus.pending => Icons.hourglass_empty,
      LabRequestStatus.cancelled => Icons.warning_amber_rounded,
      LabRequestStatus.completed => Icons.check,
    };

    return Icon(
      iconData,
      color: textColor,
      semanticLabel: 'status',
    );
  }

  Color get backgroundColor => switch (this) {
        LabRequestStatus.processing => const Color(0xFF2A270D),
        LabRequestStatus.pending => const Color(0xFF152432),
        LabRequestStatus.cancelled => const Color(0xFF3E1716),
        LabRequestStatus.completed => const Color(0xFF0D2A1F),
      };
}
