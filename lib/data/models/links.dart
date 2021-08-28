import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final List<String> homepage;
  final List<String> blockchainSite;
  final List<String> officialForumUrl;
  final List<String> chatUrl;
  final List<String> announcementUrl;
  final String subredditUrl;
  final Map<String, List<dynamic>> reposUrl;

  const Links({
    required this.homepage,
    required this.blockchainSite,
    required this.officialForumUrl,
    required this.chatUrl,
    required this.announcementUrl,
    required this.subredditUrl,
    required this.reposUrl
  });

  @override
  List<Object?> get props => [
    homepage,
    blockchainSite,
    officialForumUrl,
    chatUrl,
    announcementUrl,
    subredditUrl,
    reposUrl,
  ];

  factory Links.fromJson(Map<String, dynamic> data) {
    return Links(
      homepage: List<String>.from(data['homepage'] ?? []),
      blockchainSite: List<String>.from(data['blockchain_site'] ?? []),
      officialForumUrl: List<String>.from(data['official_forum_url'] ?? []),
      chatUrl: List<String>.from(data['chat_url'] ?? []),
      announcementUrl: List<String>.from(data['announcement_url'] ?? []),
      subredditUrl: data['subreddit_url'] ?? '',
      reposUrl: Map<String, List<dynamic>>.from(data['repos_url'] ?? {}),
    );
  }

}