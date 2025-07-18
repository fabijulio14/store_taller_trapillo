// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_registration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserRegistration _$UserRegistrationFromJson(Map<String, dynamic> json) {
  return _UserRegistration.fromJson(json);
}

/// @nodoc
mixin _$UserRegistration {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this UserRegistration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRegistration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRegistrationCopyWith<UserRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistrationCopyWith<$Res> {
  factory $UserRegistrationCopyWith(
    UserRegistration value,
    $Res Function(UserRegistration) then,
  ) = _$UserRegistrationCopyWithImpl<$Res, UserRegistration>;
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class _$UserRegistrationCopyWithImpl<$Res, $Val extends UserRegistration>
    implements $UserRegistrationCopyWith<$Res> {
  _$UserRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRegistration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserRegistrationImplCopyWith<$Res>
    implements $UserRegistrationCopyWith<$Res> {
  factory _$$UserRegistrationImplCopyWith(
    _$UserRegistrationImpl value,
    $Res Function(_$UserRegistrationImpl) then,
  ) = __$$UserRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$$UserRegistrationImplCopyWithImpl<$Res>
    extends _$UserRegistrationCopyWithImpl<$Res, _$UserRegistrationImpl>
    implements _$$UserRegistrationImplCopyWith<$Res> {
  __$$UserRegistrationImplCopyWithImpl(
    _$UserRegistrationImpl _value,
    $Res Function(_$UserRegistrationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserRegistration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(
      _$UserRegistrationImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegistrationImpl implements _UserRegistration {
  const _$UserRegistrationImpl({
    required this.name,
    required this.email,
    required this.password,
  });

  factory _$UserRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegistrationImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserRegistration(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegistrationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  /// Create a copy of UserRegistration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegistrationImplCopyWith<_$UserRegistrationImpl> get copyWith =>
      __$$UserRegistrationImplCopyWithImpl<_$UserRegistrationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegistrationImplToJson(this);
  }
}

abstract class _UserRegistration implements UserRegistration {
  const factory _UserRegistration({
    required final String name,
    required final String email,
    required final String password,
  }) = _$UserRegistrationImpl;

  factory _UserRegistration.fromJson(Map<String, dynamic> json) =
      _$UserRegistrationImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of UserRegistration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRegistrationImplCopyWith<_$UserRegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
