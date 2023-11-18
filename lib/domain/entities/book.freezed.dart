// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String? get bookTitle => throw _privateConstructorUsedError;
  String? get bookCode => throw _privateConstructorUsedError;
  String? get authorName => throw _privateConstructorUsedError;
  String? get publisherName => throw _privateConstructorUsedError;
  String? get publishYear => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String? bookTitle,
      String? bookCode,
      String? authorName,
      String? publisherName,
      String? publishYear});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookTitle = freezed,
    Object? bookCode = freezed,
    Object? authorName = freezed,
    Object? publisherName = freezed,
    Object? publishYear = freezed,
  }) {
    return _then(_value.copyWith(
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      bookCode: freezed == bookCode
          ? _value.bookCode
          : bookCode // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      publisherName: freezed == publisherName
          ? _value.publisherName
          : publisherName // ignore: cast_nullable_to_non_nullable
              as String?,
      publishYear: freezed == publishYear
          ? _value.publishYear
          : publishYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bookTitle,
      String? bookCode,
      String? authorName,
      String? publisherName,
      String? publishYear});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookTitle = freezed,
    Object? bookCode = freezed,
    Object? authorName = freezed,
    Object? publisherName = freezed,
    Object? publishYear = freezed,
  }) {
    return _then(_$BookImpl(
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      bookCode: freezed == bookCode
          ? _value.bookCode
          : bookCode // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      publisherName: freezed == publisherName
          ? _value.publisherName
          : publisherName // ignore: cast_nullable_to_non_nullable
              as String?,
      publishYear: freezed == publishYear
          ? _value.publishYear
          : publishYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl implements _Book {
  const _$BookImpl(
      {this.bookTitle,
      this.bookCode,
      this.authorName,
      this.publisherName,
      this.publishYear});

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final String? bookTitle;
  @override
  final String? bookCode;
  @override
  final String? authorName;
  @override
  final String? publisherName;
  @override
  final String? publishYear;

  @override
  String toString() {
    return 'Book(bookTitle: $bookTitle, bookCode: $bookCode, authorName: $authorName, publisherName: $publisherName, publishYear: $publishYear)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.bookCode, bookCode) ||
                other.bookCode == bookCode) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.publisherName, publisherName) ||
                other.publisherName == publisherName) &&
            (identical(other.publishYear, publishYear) ||
                other.publishYear == publishYear));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bookTitle, bookCode, authorName, publisherName, publishYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {final String? bookTitle,
      final String? bookCode,
      final String? authorName,
      final String? publisherName,
      final String? publishYear}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  String? get bookTitle;
  @override
  String? get bookCode;
  @override
  String? get authorName;
  @override
  String? get publisherName;
  @override
  String? get publishYear;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
