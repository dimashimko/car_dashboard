import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_schedule.freezed.dart';
part 'service_schedule.g.dart';

@freezed
class ServiceSchedule with _$ServiceSchedule {
  const factory ServiceSchedule({
    required String text,
    required String when,
    required double fixPrice,
  }) = _ServiceSchedule;

  factory ServiceSchedule.fromJson(Map<String, dynamic> json) =>
      _$ServiceScheduleFromJson(json);
}
