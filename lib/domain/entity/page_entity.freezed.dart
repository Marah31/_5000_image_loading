// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageEntity {

 List<ImageEntity> get products; int get page; bool get isLoadingMore; bool get hasMore; bool get forceFavoriteFailure;
/// Create a copy of PageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageEntityCopyWith<PageEntity> get copyWith => _$PageEntityCopyWithImpl<PageEntity>(this as PageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageEntity&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.page, page) || other.page == page)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.forceFavoriteFailure, forceFavoriteFailure) || other.forceFavoriteFailure == forceFavoriteFailure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),page,isLoadingMore,hasMore,forceFavoriteFailure);

@override
String toString() {
  return 'PageEntity(products: $products, page: $page, isLoadingMore: $isLoadingMore, hasMore: $hasMore, forceFavoriteFailure: $forceFavoriteFailure)';
}


}

/// @nodoc
abstract mixin class $PageEntityCopyWith<$Res>  {
  factory $PageEntityCopyWith(PageEntity value, $Res Function(PageEntity) _then) = _$PageEntityCopyWithImpl;
@useResult
$Res call({
 List<ImageEntity> products, int page, bool isLoadingMore, bool hasMore, bool forceFavoriteFailure
});




}
/// @nodoc
class _$PageEntityCopyWithImpl<$Res>
    implements $PageEntityCopyWith<$Res> {
  _$PageEntityCopyWithImpl(this._self, this._then);

  final PageEntity _self;
  final $Res Function(PageEntity) _then;

/// Create a copy of PageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? page = null,Object? isLoadingMore = null,Object? hasMore = null,Object? forceFavoriteFailure = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ImageEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,forceFavoriteFailure: null == forceFavoriteFailure ? _self.forceFavoriteFailure : forceFavoriteFailure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PageEntity].
extension PageEntityPatterns on PageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageEntity value)  $default,){
final _that = this;
switch (_that) {
case _PageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ImageEntity> products,  int page,  bool isLoadingMore,  bool hasMore,  bool forceFavoriteFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageEntity() when $default != null:
return $default(_that.products,_that.page,_that.isLoadingMore,_that.hasMore,_that.forceFavoriteFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ImageEntity> products,  int page,  bool isLoadingMore,  bool hasMore,  bool forceFavoriteFailure)  $default,) {final _that = this;
switch (_that) {
case _PageEntity():
return $default(_that.products,_that.page,_that.isLoadingMore,_that.hasMore,_that.forceFavoriteFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ImageEntity> products,  int page,  bool isLoadingMore,  bool hasMore,  bool forceFavoriteFailure)?  $default,) {final _that = this;
switch (_that) {
case _PageEntity() when $default != null:
return $default(_that.products,_that.page,_that.isLoadingMore,_that.hasMore,_that.forceFavoriteFailure);case _:
  return null;

}
}

}

/// @nodoc


class _PageEntity extends PageEntity {
  const _PageEntity({final  List<ImageEntity> products = const [], this.page = 1, this.isLoadingMore = false, this.hasMore = true, this.forceFavoriteFailure = false}): _products = products,super._();
  

 final  List<ImageEntity> _products;
@override@JsonKey() List<ImageEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool forceFavoriteFailure;

/// Create a copy of PageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageEntityCopyWith<_PageEntity> get copyWith => __$PageEntityCopyWithImpl<_PageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageEntity&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.page, page) || other.page == page)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.forceFavoriteFailure, forceFavoriteFailure) || other.forceFavoriteFailure == forceFavoriteFailure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),page,isLoadingMore,hasMore,forceFavoriteFailure);

@override
String toString() {
  return 'PageEntity(products: $products, page: $page, isLoadingMore: $isLoadingMore, hasMore: $hasMore, forceFavoriteFailure: $forceFavoriteFailure)';
}


}

/// @nodoc
abstract mixin class _$PageEntityCopyWith<$Res> implements $PageEntityCopyWith<$Res> {
  factory _$PageEntityCopyWith(_PageEntity value, $Res Function(_PageEntity) _then) = __$PageEntityCopyWithImpl;
@override @useResult
$Res call({
 List<ImageEntity> products, int page, bool isLoadingMore, bool hasMore, bool forceFavoriteFailure
});




}
/// @nodoc
class __$PageEntityCopyWithImpl<$Res>
    implements _$PageEntityCopyWith<$Res> {
  __$PageEntityCopyWithImpl(this._self, this._then);

  final _PageEntity _self;
  final $Res Function(_PageEntity) _then;

/// Create a copy of PageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? page = null,Object? isLoadingMore = null,Object? hasMore = null,Object? forceFavoriteFailure = null,}) {
  return _then(_PageEntity(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ImageEntity>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,forceFavoriteFailure: null == forceFavoriteFailure ? _self.forceFavoriteFailure : forceFavoriteFailure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
