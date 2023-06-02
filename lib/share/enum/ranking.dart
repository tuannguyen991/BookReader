import 'package:json_annotation/json_annotation.dart';

enum Ranking {
  @JsonValue(0)
  gold,
  @JsonValue(1)
  silver,
  @JsonValue(2)
  bronze
}
