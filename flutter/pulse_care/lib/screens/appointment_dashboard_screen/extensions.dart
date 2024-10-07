import 'package:flutter/material.dart';
import 'package:pulse_care/models/patient_appointment.dart';

import '../../theme/colors.dart';

extension on AppointmentStatus {
  Color get textColor => switch (this) {
        AppointmentStatus.scheduled => AppColors.lightGreen,
        AppointmentStatus.pending => AppColors.lightBlue,
        AppointmentStatus.cancel => AppColors.lightred,
      };

  IconData get chipIconData => switch (this) {
        AppointmentStatus.scheduled => Icons.check,
        AppointmentStatus.pending => Icons.hourglass_empty,
        AppointmentStatus.cancel => Icons.cancel_outlined,
      };

  Icon get cardIcons => switch (this) {
        AppointmentStatus.scheduled => Icon(
            Icons.edit_calendar_outlined,
            color: textColor,
          ),
        AppointmentStatus.pending => Icon(
            Icons.hourglass_empty,
            color: textColor,
          ),
        AppointmentStatus.cancel => Icon(
            Icons.warning_amber_rounded,
            color: textColor,
          ),
      };

  Color get chipBackgroundColor => switch (this) {
        AppointmentStatus.scheduled => AppColors.darkGreen,
        AppointmentStatus.pending => AppColors.darkBlue,
        AppointmentStatus.cancel => AppColors.darkRed,
      };
}
