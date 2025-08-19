import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/datasources/profile_datasource.dart';
import '../models/user_profile_model.dart';

part 'profile_datasource_impl.g.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  ProfileDataSourceImpl({required FirebaseAuth firebaseAuth, required FirebaseFirestore firestore})
    : _firebaseAuth = firebaseAuth,
      _firestore = firestore;

  @override
  Future<UserProfile?> getUserProfile(String uid) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null || user.uid != uid) return null;

      // Obtener datos adicionales de Firestore
      final doc = await _firestore.collection('users').doc(uid).get();

      Map<String, dynamic> firestoreData = {};
      if (doc.exists && doc.data() != null) {
        firestoreData = doc.data()!;
      }

      print('User profile loaded: ${user.uid}, Email: ${user.email}');
      print('Firestore data: $firestoreData');

      return UserProfile(
        uid: user.uid,
        email: user.email ?? firestoreData['email'] ?? '',
        name: firestoreData['name'],
        username: firestoreData['username'],
        phone: firestoreData['phone'],
        address: firestoreData['address'],
        country: firestoreData['country'],
        createdAt: user.metadata.creationTime ?? _parseDateTime(firestoreData['createdAt']),
        lastLoginAt: user.metadata.lastSignInTime ?? _parseDateTime(firestoreData['lastLoginAt']),
        updatedAt: _parseDateTime(firestoreData['updatedAt']),
        emailVerified: user.emailVerified,
        additionalInfo: _extractAdditionalInfo(firestoreData),
      );
    } catch (e) {
      throw Exception('Error getting user profile: $e');
    }
  }

  DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  Map<String, dynamic> _extractAdditionalInfo(Map<String, dynamic> data) {
    // Filtrar campos básicos para obtener solo información adicional
    final basicFields = {
      'uid',
      'email',
      'name',
      'username',
      'displayName',
      'photoURL',
      'phone',
      'phoneNumber',
      'address',
      'country',
      'createdAt',
      'lastLoginAt',
      'updatedAt',
      'emailVerified',
    };

    return Map.fromEntries(data.entries.where((entry) => !basicFields.contains(entry.key)));
  }
}

@riverpod
ProfileDataSource profileDataSource(Ref ref) {
  return ProfileDataSourceImpl(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
}
