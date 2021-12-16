import 'package:crypto_tracker_app/domain/entities/community_data.dart';
import 'package:equatable/equatable.dart';

class CommunityDataResponse extends Equatable {
  final int facebookLikes;
  final int twitterFollowers;
  final double redditAveragePosts48h;
  final double redditAverageComments48h;
  final int redditSubscribers;
  final int redditAccountsActive48h;
  final int telegramChannelUserCount;

  const CommunityDataResponse({
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

  CommunityData toEntity() {
    return CommunityData(
        facebookLikes: facebookLikes,
        twitterFollowers: twitterFollowers,
        redditAveragePosts48h: redditAveragePosts48h,
        redditAverageComments48h: redditAverageComments48h,
        redditSubscribers: redditSubscribers,
        redditAccountsActive48h: redditAccountsActive48h,
        telegramChannelUserCount: telegramChannelUserCount
    );
  }

  factory CommunityDataResponse.fromJson(Map<String, dynamic> data) {
    return CommunityDataResponse(
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