class TokenModel {
  final String token;

  TokenModel(this.token);

  factory TokenModel.fromJson(jsonData) {
    return TokenModel(
      jsonData['token'],
    );
  }
}
