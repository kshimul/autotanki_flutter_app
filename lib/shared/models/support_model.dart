import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_model.freezed.dart';
part 'support_model.g.dart';

// Ticket category enum — API-verified (was missing in v3.0)
enum TicketCategory {
  @JsonValue('GENERAL') general,
  @JsonValue('BILLING') billing,
  @JsonValue('TECHNICAL') technical,
  @JsonValue('DEVICE') device,
  @JsonValue('OTHER') other,
}

enum TicketStatus {
  @JsonValue('OPEN') open,
  @JsonValue('IN_PROGRESS') inProgress,
  @JsonValue('RESOLVED') resolved,
  @JsonValue('CLOSED') closed,
}

@freezed
class SupportTicket with _$SupportTicket {
  const factory SupportTicket({
    required String id,
    required String userId,
    String? deviceId,              // Optional device link — API-verified
    required String subject,
    required String description,
    required TicketCategory category,
    @Default(TicketStatus.open) TicketStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SupportTicket;

  factory SupportTicket.fromJson(Map<String, dynamic> json) =>
      _$SupportTicketFromJson(json);
}

@freezed
class CreateTicketRequest with _$CreateTicketRequest {
  const factory CreateTicketRequest({
    String? deviceId,
    required String subject,
    required String description,
    required TicketCategory category,
  }) = _CreateTicketRequest;

  factory CreateTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketRequestFromJson(json);
}
