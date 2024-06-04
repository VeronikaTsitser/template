// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarouselItemModelImpl _$$CarouselItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CarouselItemModelImpl(
      pageIndex: (json['pageIndex'] as num).toInt(),
      imagePath: json['imagePath'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$CarouselItemModelImplToJson(
        _$CarouselItemModelImpl instance) =>
    <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'description': instance.description,
    };
