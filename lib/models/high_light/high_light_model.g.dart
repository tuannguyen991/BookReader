// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'high_light_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HighLightModel _$$_HighLightModelFromJson(Map<String, dynamic> json) =>
    _$_HighLightModel(
      bookId: json['bookId'] as String? ?? '',
      content: json['content'] as String? ?? '',
      date: json['date'] as String? ?? '',
      note: json['note'] as String?,
      pageId: json['pageId'] as String? ?? '',
      pageNumber: json['pageNumber'] as int? ?? 0,
      rangy: json['rangy'] as String? ?? '',
      type: json['type'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
    );

Map<String, dynamic> _$$_HighLightModelToJson(_$_HighLightModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'content': instance.content,
      'date': instance.date,
      'note': instance.note,
      'pageId': instance.pageId,
      'pageNumber': instance.pageNumber,
      'rangy': instance.rangy,
      'type': instance.type,
      'uuid': instance.uuid,
    };
