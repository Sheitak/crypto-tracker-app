import 'dart:convert';

import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DeveloperData extends Equatable {
  int id;
  final int fork;
  final int stars;
  final int subscribers;
  final int totalIssues;
  final int closedIssues;
  final int pullRequestMerged;
  final int pullRequestContributors;
  // Map<String, int> codeAdditionsDeletions4Weeks;
  final int commitCountForWeeks;
  final List<String> last4WeeksCommitActivitySeries;
  final coin = ToOne<Coin>();

  // TODO: codeAdditionsDeletions4Weeks stand-by
  DeveloperData({
    this.id = 0,
    required this.fork,
    required this.stars,
    required this.subscribers,
    required this.totalIssues,
    required this.closedIssues,
    required this.pullRequestMerged,
    required this.pullRequestContributors,
    // required this.codeAdditionsDeletions4Weeks,
    required this.commitCountForWeeks,
    required this.last4WeeksCommitActivitySeries
  });

  @override
  List<Object?> get props => [
    fork,
    stars,
    subscribers,
    totalIssues,
    closedIssues,
    pullRequestMerged,
    pullRequestContributors,
    // codeAdditionsDeletions4Weeks,
    commitCountForWeeks,
    last4WeeksCommitActivitySeries
  ];

  factory DeveloperData.fromJson(Map<String, dynamic> data) {
    return DeveloperData(
      fork: data['fork'] ?? 0,
      stars: data['stars'] ?? 0,
      subscribers: data['subscribers'] ?? 0,
      totalIssues: data['total_issues'] ?? 0,
      closedIssues: data['closed_issues'] ?? 0,
      pullRequestMerged: data['pull_requests_merged'] ?? 0,
      pullRequestContributors: data['pull_request_contributors'] ?? 0,
      // codeAdditionsDeletions4Weeks: data['code_additions_deletions_4_weeks'] ?? {},
      commitCountForWeeks: data['commit_count_4_weeks'] ?? 0,
      last4WeeksCommitActivitySeries: data['last_4_weeks_commit_activity_series'] ?? [],
    );
  }

  // String get dbCodeAdditionsDeletions4Weeks => json.encode(codeAdditionsDeletions4Weeks);
  //
  // set dbCodeAdditionsDeletions4Weeks(String element) => codeAdditionsDeletions4Weeks = Map.from(
  //     json.decode(element).map((key, value) => MapEntry(key as String, value as int))
  // );
}