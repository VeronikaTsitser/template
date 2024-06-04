// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarouselItemModel _$CarouselItemModelFromJson(Map<String, dynamic> json) {
  return _CarouselItemModel.fromJson(json);
}

/// @nodoc
mixin _$CarouselItemModel {
  int get pageIndex => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarouselItemModelCopyWith<CarouselItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselItemModelCopyWith<$Res> {
  factory $CarouselItemModelCopyWith(
          CarouselItemModel value, $Res Function(CarouselItemModel) then) =
      _$CarouselItemModelCopyWithImpl<$Res, CarouselItemModel>;
  @useResult
  $Res call(
      {int pageIndex, String imagePath, String title, String description});
}

/// @nodoc
class _$CarouselItemModelCopyWithImpl<$Res, $Val extends CarouselItemModel>
    implements $CarouselItemModelCopyWith<$Res> {
  _$CarouselItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? imagePath = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarouselItemModelImplCopyWith<$Res>
    implements $CarouselItemModelCopyWith<$Res> {
  factory _$$CarouselItemModelImplCopyWith(_$CarouselItemModelImpl value,
          $Res Function(_$CarouselItemModelImpl) then) =
      __$$CarouselItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pageIndex, String imagePath, String title, String description});
}

/// @nodoc
class __$$CarouselItemModelImplCopyWithImpl<$Res>
    extends _$CarouselItemModelCopyWithImpl<$Res, _$CarouselItemModelImpl>
    implements _$$CarouselItemModelImplCopyWith<$Res> {
  __$$CarouselItemModelImplCopyWithImpl(_$CarouselItemModelImpl _value,
      $Res Function(_$CarouselItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
    Object? imagePath = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$CarouselItemModelImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarouselItemModelImpl implements _CarouselItemModel {
  _$CarouselItemModelImpl(
      {required this.pageIndex,
      required this.imagePath,
      required this.title,
      required this.description});

  factory _$CarouselItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarouselItemModelImplFromJson(json);

  @override
  final int pageIndex;
  @override
  final String imagePath;
  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'CarouselItemModel(pageIndex: $pageIndex, imagePath: $imagePath, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarouselItemModelImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pageIndex, imagePath, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarouselItemModelImplCopyWith<_$CarouselItemModelImpl> get copyWith =>
      __$$CarouselItemModelImplCopyWithImpl<_$CarouselItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarouselItemModelImplToJson(
      this,
    );
  }
}

abstract class _CarouselItemModel implements CarouselItemModel {
  factory _CarouselItemModel(
      {required final int pageIndex,
      required final String imagePath,
      required final String title,
      required final String description}) = _$CarouselItemModelImpl;

  factory _CarouselItemModel.fromJson(Map<String, dynamic> json) =
      _$CarouselItemModelImpl.fromJson;

  @override
  int get pageIndex;
  @override
  String get imagePath;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$CarouselItemModelImplCopyWith<_$CarouselItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
