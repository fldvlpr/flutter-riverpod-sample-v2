// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostResponse {

 List<Post> get posts;
/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostResponseCopyWith<PostResponse> get copyWith => _$PostResponseCopyWithImpl<PostResponse>(this as PostResponse, _$identity);

  /// Serializes this PostResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostResponse&&const DeepCollectionEquality().equals(other.posts, posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(posts));

@override
String toString() {
  return 'PostResponse(posts: $posts)';
}


}

/// @nodoc
abstract mixin class $PostResponseCopyWith<$Res>  {
  factory $PostResponseCopyWith(PostResponse value, $Res Function(PostResponse) _then) = _$PostResponseCopyWithImpl;
@useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class _$PostResponseCopyWithImpl<$Res>
    implements $PostResponseCopyWith<$Res> {
  _$PostResponseCopyWithImpl(this._self, this._then);

  final PostResponse _self;
  final $Res Function(PostResponse) _then;

/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}

}


/// Adds pattern-matching-related methods to [PostResponse].
extension PostResponsePatterns on PostResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostResponse value)  $default,){
final _that = this;
switch (_that) {
case _PostResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Post> posts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
return $default(_that.posts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Post> posts)  $default,) {final _that = this;
switch (_that) {
case _PostResponse():
return $default(_that.posts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Post> posts)?  $default,) {final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
return $default(_that.posts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostResponse implements PostResponse {
  const _PostResponse({required final  List<Post> posts}): _posts = posts;
  factory _PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);

 final  List<Post> _posts;
@override List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostResponseCopyWith<_PostResponse> get copyWith => __$PostResponseCopyWithImpl<_PostResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostResponse&&const DeepCollectionEquality().equals(other._posts, _posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'PostResponse(posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$PostResponseCopyWith<$Res> implements $PostResponseCopyWith<$Res> {
  factory _$PostResponseCopyWith(_PostResponse value, $Res Function(_PostResponse) _then) = __$PostResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Post> posts
});




}
/// @nodoc
class __$PostResponseCopyWithImpl<$Res>
    implements _$PostResponseCopyWith<$Res> {
  __$PostResponseCopyWithImpl(this._self, this._then);

  final _PostResponse _self;
  final $Res Function(_PostResponse) _then;

/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(_PostResponse(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

// dart format on
