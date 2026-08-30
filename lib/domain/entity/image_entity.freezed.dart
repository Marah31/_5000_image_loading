// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageEntity {

 int get albumId; int get id; String get title; String get url; String get thumbnailUrl;
/// Create a copy of ImageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageEntityCopyWith<ImageEntity> get copyWith => _$ImageEntityCopyWithImpl<ImageEntity>(this as ImageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageEntity&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}


@override
int get hashCode => Object.hash(runtimeType,albumId,id,title,url,thumbnailUrl);

@override
String toString() {
  return 'ImageEntity(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $ImageEntityCopyWith<$Res>  {
  factory $ImageEntityCopyWith(ImageEntity value, $Res Function(ImageEntity) _then) = _$ImageEntityCopyWithImpl;
@useResult
$Res call({
 int albumId, int id, String title, String url, String thumbnailUrl
});




}
/// @nodoc
class _$ImageEntityCopyWithImpl<$Res>
    implements $ImageEntityCopyWith<$Res> {
  _$ImageEntityCopyWithImpl(this._self, this._then);

  final ImageEntity _self;
  final $Res Function(ImageEntity) _then;

/// Create a copy of ImageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? albumId = null,Object? id = null,Object? title = null,Object? url = null,Object? thumbnailUrl = null,}) {
  return _then(_self.copyWith(
albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageEntity].
extension ImageEntityPatterns on ImageEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageEntity value)  $default,){
final _that = this;
switch (_that) {
case _ImageEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ImageEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int albumId,  int id,  String title,  String url,  String thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageEntity() when $default != null:
return $default(_that.albumId,_that.id,_that.title,_that.url,_that.thumbnailUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int albumId,  int id,  String title,  String url,  String thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _ImageEntity():
return $default(_that.albumId,_that.id,_that.title,_that.url,_that.thumbnailUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int albumId,  int id,  String title,  String url,  String thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _ImageEntity() when $default != null:
return $default(_that.albumId,_that.id,_that.title,_that.url,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc


class _ImageEntity extends ImageEntity {
  const _ImageEntity({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl}): super._();
  

@override final  int albumId;
@override final  int id;
@override final  String title;
@override final  String url;
@override final  String thumbnailUrl;

/// Create a copy of ImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageEntityCopyWith<_ImageEntity> get copyWith => __$ImageEntityCopyWithImpl<_ImageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageEntity&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}


@override
int get hashCode => Object.hash(runtimeType,albumId,id,title,url,thumbnailUrl);

@override
String toString() {
  return 'ImageEntity(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$ImageEntityCopyWith<$Res> implements $ImageEntityCopyWith<$Res> {
  factory _$ImageEntityCopyWith(_ImageEntity value, $Res Function(_ImageEntity) _then) = __$ImageEntityCopyWithImpl;
@override @useResult
$Res call({
 int albumId, int id, String title, String url, String thumbnailUrl
});




}
/// @nodoc
class __$ImageEntityCopyWithImpl<$Res>
    implements _$ImageEntityCopyWith<$Res> {
  __$ImageEntityCopyWithImpl(this._self, this._then);

  final _ImageEntity _self;
  final $Res Function(_ImageEntity) _then;

/// Create a copy of ImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? albumId = null,Object? id = null,Object? title = null,Object? url = null,Object? thumbnailUrl = null,}) {
  return _then(_ImageEntity(
albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
