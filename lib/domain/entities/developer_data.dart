import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DeveloperData extends Equatable {
  int id;
  final int forks;
  final int stars;
  final int subscribers;
  final int totalIssues;
  final int closedIssues;
  final int pullRequestMerged;
  final int pullRequestContributors;
  // Map<String, int> codeAdditionsDeletions4Weeks;
  final String codeAdditionsDeletions4Weeks;
  final int commitCountForWeeks;
  final List<String> last4WeeksCommitActivitySeries;
  final coin = ToOne<Coin>();

  DeveloperData({
    this.id = 0,
    required this.forks,
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
    forks,
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
}