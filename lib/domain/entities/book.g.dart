// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: json['id'] as String?,
      bookTitle: json['bookTitle'] as String?,
      bookCode: json['bookCode'] as String?,
      authorName: json['authorName'] as String?,
      publisherName: json['publisherName'] as String?,
      publisherYear: json['publisherYear'] as String?,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookTitle': instance.bookTitle,
      'bookCode': instance.bookCode,
      'authorName': instance.authorName,
      'publisherName': instance.publisherName,
      'publisherYear': instance.publisherYear,
    };
