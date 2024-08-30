import 'dart:convert';

class ImageResponse {
  final String? message;
  final String? photoUrl;

  ImageResponse({
    this.message,
    this.photoUrl,
  });

  factory ImageResponse.fromRawJson(String str) => ImageResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        message: json["message"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "photo_url": photoUrl,
      };
}
