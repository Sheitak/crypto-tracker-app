import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CommunityData extends Equatable {
  int id;
  final int facebookLikes;
  final int twitterFollowers;
  final double redditAveragePosts48h;
  final double redditAverageComments48h;
  final int redditSubscribers;
  final int redditAccountsActive48h;
  final int telegramChannelUserCount;
  final coin = ToOne<Coin>();

  CommunityData({
    this.id = 0,
    required this.facebookLikes,
    required this.twitterFollowers,
    required this.redditAveragePosts48h,
    required this.redditAverageComments48h,
    required this.redditSubscribers,
    required this.redditAccountsActive48h,
    required this.telegramChannelUserCount
  });

  @override
  List<Object?> get props => [
    facebookLikes,
    twitterFollowers,
    redditAveragePosts48h,
    redditAverageComments48h,
    redditSubscribers,
    redditAccountsActive48h,
    telegramChannelUserCount
  ];
}