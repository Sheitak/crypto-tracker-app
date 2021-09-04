import 'package:equatable/equatable.dart';

class CommunityData extends Equatable {
  final int facebookLikes;
  final int twitterFollowers;
  final double redditAveragePosts48h;
  final double redditAverageComments48h;
  final int redditSubscribers;
  final int redditAccountsActive48h;
  final int telegramChannelUserCount;

  const CommunityData({
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

  factory CommunityData.fromJson(Map<String, dynamic> data) {
    return CommunityData(
        facebookLikes: data['facebook_likes'] ?? 0,
        twitterFollowers: data['twitter_followers'] ?? 0,
        redditAveragePosts48h: data['reddit_average_posts_48h'] ?? 0.0,
        redditAverageComments48h: data['reddit_average_comments_48h'] ?? 0.0,
        redditSubscribers: data['reddit_subscribers'] ?? 0,
        redditAccountsActive48h: data['reddit_accounts_active_48h'] ?? 0,
        telegramChannelUserCount: data['telegram_channel_user_count'] ?? 0
    );
  }
}