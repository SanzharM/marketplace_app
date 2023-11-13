import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? avatar;
  final String? username;
  final String? email;
  final dynamic city;
  final bool isActive;
  final bool isAuthorized;

  const UserEntity({
    this.id,
    this.avatar,
    this.username,
    this.email,
    this.city,
    this.isActive = true,
    this.isAuthorized = false,
  });

  UserEntity copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? avatar,
    ValueGetter<String?>? username,
    ValueGetter<String?>? email,
    dynamic? city,
    bool? isActive,
    bool? isAuthorized,
  }) {
    return UserEntity(
      id: id?.call() ?? this.id,
      avatar: avatar?.call() ?? this.avatar,
      username: username?.call() ?? this.username,
      email: email?.call() ?? this.email,
      city: city ?? this.city,
      isActive: isActive ?? this.isActive,
      isAuthorized: isAuthorized ?? this.isAuthorized,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      avatar,
      username,
      email,
      city,
      isActive,
      isAuthorized,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'avatar': avatar,
      'username': username,
      'email': email,
      'city': city,
      'is_active': isActive,
      'is_authorized': isAuthorized,
    };
  }
}
