import 'package:json_annotation/json_annotation.dart';

enum Ranking {
  @JsonValue(1)
  gold,
  @JsonValue(2)
  silver,
  @JsonValue(3)
  bronze
}
