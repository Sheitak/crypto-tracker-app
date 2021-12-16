import 'dart:convert';

import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Links extends Equatable {
  int id;
  final List<String> homepage;
  final List<String> blockchainSite;
  final List<String> officialForumUrl;
  final List<String> chatUrl;
  final List<String> announcementUrl;
  final String subredditUrl;
  // Map<String, List<String>> reposUrl;
  final coin = ToOne<Coin>();

  // TODO: reposUrl stand-by
  Links({
    this.id = 0,
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
}