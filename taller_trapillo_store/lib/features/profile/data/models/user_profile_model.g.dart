// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      username: json['username'] as String?,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      phone: json['phone'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      lastLoginAt:
          json['lastLoginAt'] == null
              ? null
              : DateTime.parse(json['lastLoginAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      emailVerified: json['emailVerified'] as bool?,
      additionalInfo:
          json['additionalInfo'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'username': instance.username,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'phone': instance.phone,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'country': instance.country,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'emailVerified': instance.emailVerified,
      'additionalInfo': instance.additionalInfo,
    };
