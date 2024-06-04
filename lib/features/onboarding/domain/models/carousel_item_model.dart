import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_item_model.freezed.dart';
part 'carousel_item_model.g.dart';

@freezed
class CarouselItemModel with _$CarouselItemModel {
  factory CarouselItemModel({
    required int pageIndex,
    required String imagePath,
    required String title,
    required String description,
  }) = _CarouselItemModel;

  factory CarouselItemModel.fromJson(Map<String, dynamic> json) => _$CarouselItemModelFromJson(json);
}
