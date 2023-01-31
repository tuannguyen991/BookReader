import 'package:json_annotation/json_annotation.dart';

enum Ranking {
  @JsonValue(1)
  gold,
  @JsonValue(2)
  silver,
  @JsonValue(3)
  bronze
}

extension RankingExtension on Ranking {
  String get image {
    switch (this) {
      case Ranking.bronze:
        return 'assets/image/ranking/bronze.png';
      case Ranking.silver:
        return 'assets/image/ranking/silver.png';
      default:
        return 'assets/image/ranking/gold.png';
    }
  }
}