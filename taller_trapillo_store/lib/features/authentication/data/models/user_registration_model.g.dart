// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegistrationImpl _$$UserRegistrationImplFromJson(
  Map<String, dynamic> json,
) => _$UserRegistrationImpl(
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  username: json['username'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$$UserRegistrationImplToJson(
  _$UserRegistrationImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'username': instance.username,
  'phone': instance.phone,
  'address': instance.address,
  'country': instance.country,
};
