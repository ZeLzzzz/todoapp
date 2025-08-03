class TokenModel {
  final String type;
  final String token;
  final List<String> abilities;
  final DateTime? expiresAt;

  TokenModel({
    required this.type,
    required this.token,
    required this.abilities,
    this.expiresAt,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      type: json['type'] ?? '',
      token: json['token'] ?? '',
      abilities: List<String>.from(json['abilities'] ?? []),
      expiresAt: json['expiresAt'] != null ? DateTime.tryParse(json['expiresAt']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'token': token,
        'abilities': abilities,
        'expiresAt': expiresAt?.toIso8601String(),
      };
}
