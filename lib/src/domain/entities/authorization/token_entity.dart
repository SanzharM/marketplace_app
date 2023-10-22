import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class TokenEntity extends Equatable {
  final String? access;
  final String? refresh;

  const TokenEntity({
    required this.access,
    required this.refresh,
  });

  TokenEntity copyWith({
    ValueGetter<String?>? access,
    ValueGetter<String?>? refresh,
  }) {
    return TokenEntity(
      access: access != null ? access() : this.access,
      refresh: refresh != null ? refresh() : this.refresh,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access': access,
      'refresh': refresh,
    };
  }

  @override
  String toString() => 'TokenEntity(access: $access, refresh: $refresh)';

  @override
  List<Object?> get props => [access, refresh];
}
