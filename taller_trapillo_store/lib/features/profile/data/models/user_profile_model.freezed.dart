// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get emailVerified => throw _privateConstructorUsedError;
  Map<String, dynamic> get additionalInfo => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    String uid,
    String email,
    String? name,
    String? username,
    String? displayName,
    String? photoURL,
    String? phone,
    String? phoneNumber,
    String? address,
    String? country,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    DateTime? updatedAt,
    bool? emailVerified,
    Map<String, dynamic> additionalInfo,
  });
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? name = freezed,
    Object? username = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? phone = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? createdAt = freezed,
    Object? lastLoginAt = freezed,
    Object? updatedAt = freezed,
    Object? emailVerified = freezed,
    Object? additionalInfo = null,
  }) {
    return _then(
      _value.copyWith(
            uid:
                null == uid
                    ? _value.uid
                    : uid // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            username:
                freezed == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
                        as String?,
            displayName:
                freezed == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String?,
            photoURL:
                freezed == photoURL
                    ? _value.photoURL
                    : photoURL // ignore: cast_nullable_to_non_nullable
                        as String?,
            phone:
                freezed == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String?,
            phoneNumber:
                freezed == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String?,
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            lastLoginAt:
                freezed == lastLoginAt
                    ? _value.lastLoginAt
                    : lastLoginAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            emailVerified:
                freezed == emailVerified
                    ? _value.emailVerified
                    : emailVerified // ignore: cast_nullable_to_non_nullable
                        as bool?,
            additionalInfo:
                null == additionalInfo
                    ? _value.additionalInfo
                    : additionalInfo // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String uid,
    String email,
    String? name,
    String? username,
    String? displayName,
    String? photoURL,
    String? phone,
    String? phoneNumber,
    String? address,
    String? country,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    DateTime? updatedAt,
    bool? emailVerified,
    Map<String, dynamic> additionalInfo,
  });
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? name = freezed,
    Object? username = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? phone = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? createdAt = freezed,
    Object? lastLoginAt = freezed,
    Object? updatedAt = freezed,
    Object? emailVerified = freezed,
    Object? additionalInfo = null,
  }) {
    return _then(
      _$UserProfileImpl(
        uid:
            null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        username:
            freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String?,
        displayName:
            freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String?,
        photoURL:
            freezed == photoURL
                ? _value.photoURL
                : photoURL // ignore: cast_nullable_to_non_nullable
                    as String?,
        phone:
            freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String?,
        phoneNumber:
            freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String?,
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        lastLoginAt:
            freezed == lastLoginAt
                ? _value.lastLoginAt
                : lastLoginAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        emailVerified:
            freezed == emailVerified
                ? _value.emailVerified
                : emailVerified // ignore: cast_nullable_to_non_nullable
                    as bool?,
        additionalInfo:
            null == additionalInfo
                ? _value._additionalInfo
                : additionalInfo // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    required this.uid,
    required this.email,
    this.name,
    this.username,
    this.displayName,
    this.photoURL,
    this.phone,
    this.phoneNumber,
    this.address,
    this.country,
    this.createdAt,
    this.lastLoginAt,
    this.updatedAt,
    this.emailVerified,
    final Map<String, dynamic> additionalInfo = const {},
  }) : _additionalInfo = additionalInfo;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? displayName;
  @override
  final String? photoURL;
  @override
  final String? phone;
  @override
  final String? phoneNumber;
  @override
  final String? address;
  @override
  final String? country;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastLoginAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? emailVerified;
  final Map<String, dynamic> _additionalInfo;
  @override
  @JsonKey()
  Map<String, dynamic> get additionalInfo {
    if (_additionalInfo is EqualUnmodifiableMapView) return _additionalInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalInfo);
  }

  @override
  String toString() {
    return 'UserProfile(uid: $uid, email: $email, name: $name, username: $username, displayName: $displayName, photoURL: $photoURL, phone: $phone, phoneNumber: $phoneNumber, address: $address, country: $country, createdAt: $createdAt, lastLoginAt: $lastLoginAt, updatedAt: $updatedAt, emailVerified: $emailVerified, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            const DeepCollectionEquality().equals(
              other._additionalInfo,
              _additionalInfo,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    uid,
    email,
    name,
    username,
    displayName,
    photoURL,
    phone,
    phoneNumber,
    address,
    country,
    createdAt,
    lastLoginAt,
    updatedAt,
    emailVerified,
    const DeepCollectionEquality().hash(_additionalInfo),
  );

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    required final String uid,
    required final String email,
    final String? name,
    final String? username,
    final String? displayName,
    final String? photoURL,
    final String? phone,
    final String? phoneNumber,
    final String? address,
    final String? country,
    final DateTime? createdAt,
    final DateTime? lastLoginAt,
    final DateTime? updatedAt,
    final bool? emailVerified,
    final Map<String, dynamic> additionalInfo,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get displayName;
  @override
  String? get photoURL;
  @override
  String? get phone;
  @override
  String? get phoneNumber;
  @override
  String? get address;
  @override
  String? get country;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastLoginAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get emailVerified;
  @override
  Map<String, dynamic> get additionalInfo;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
