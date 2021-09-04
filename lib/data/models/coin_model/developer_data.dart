import 'package:equatable/equatable.dart';

class DeveloperData extends Equatable {
  final int fork;
  final int stars;
  final int subscribers;
  final int totalIssues;
  final int closedIssues;
  final int pullRequestMerged;
  final int pullRequestContributors;
  final Map<String, dynamic> codeAdditionsDeletions4Weeks;
  final int commitCountForWeeks;
  final List<int> last4WeeksCommitActivitySeries;

  const DeveloperData({
    required this.fork,
    required this.stars,
    required this.subscribers,
    required this.totalIssues,
    required this.closedIssues,
    required this.pullRequestMerged,
    required this.pullRequestContributors,
    required this.codeAdditionsDeletions4Weeks,
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
    codeAdditionsDeletions4Weeks,
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
      codeAdditionsDeletions4Weeks: data['code_additions_deletions_4_weeks'] ?? {},
      commitCountForWeeks: data['commit_count_4_weeks'] ?? 0,
      last4WeeksCommitActivitySeries: data['last_4_weeks_commit_activity_series'] ?? [],
    );
  }
}