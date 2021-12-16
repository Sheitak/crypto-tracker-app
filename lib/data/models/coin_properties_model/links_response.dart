import 'package:crypto_tracker_app/domain/entities/links.dart';
import 'package:equatable/equatable.dart';

class LinksResponse extends Equatable {
  final List<String> homepage;
  final List<String> blockchainSite;
  final List<String> officialForumUrl;
  final List<String> chatUrl;
  final List<String> announcementUrl;
  final String subredditUrl;
  // Map<String, List<String>> reposUrl;

  // TODO: reposUrl stand-by
  const LinksResponse({
    required this.homepage,
    required this.blockchainSite,
    required this.officialForumUrl,
    required this.chatUrl,
    required this.announcementUrl,
    required this.subredditUrl,
    // required this.reposUrl
  });

  @override
  List<Object?> get props => [
    homepage,
    blockchainSite,
    officialForumUrl,
    chatUrl,
    announcementUrl,
    subredditUrl,
    // reposUrl,
  ];

  Links toEntity() {
    return Links(
        homepage: homepage,
        blockchainSite: blockchainSite,
        officialForumUrl: officialForumUrl,
        chatUrl: chatUrl,
        announcementUrl: announcementUrl,
        subredditUrl: subredditUrl
    );
  }

  factory LinksResponse.fromJson(Map<String, dynamic> data) {
    return LinksResponse(
      homepage: List<String>.from(data['homepage'] ?? []),
      blockchainSite: List<String>.from(data['blockchain_site'] ?? []),
      officialForumUrl: List<String>.from(data['official_forum_url'] ?? []),
      chatUrl: List<String>.from(data['chat_url'] ?? []),
      announcementUrl: List<String>.from(data['announcement_url'] ?? []),
      subredditUrl: data['subreddit_url'] ?? '',
      // reposUrl: Map<String, List<String>>.from(data['repos_url'] ?? {}),
    );
  }
}