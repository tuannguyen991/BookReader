import 'package:demo_book_reader/share/enum/ranking.dart';

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

  String get name {
    switch (this) {
      case Ranking.bronze:
        return 'HẠNG ĐỒNG';
      case Ranking.silver:
        return 'HẠNG BẠC';
      default:
        return 'HẠNG VÀNG';
    }
  }
}
