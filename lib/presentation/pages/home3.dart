import 'package:crypto_tracker_app/presentation/viewmodel/Coins_list_view_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _HomeState extends HookWidget {

  final pageController = usePageController();
  final viewModelState = useProvider(coinsListViewModelProvider);
  final questionsFuture = useProvider(coinsListProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crypto tracker app'),
        centerTitle: true,
      ),
      body: Center(
        // TEST
      ),
    );
  }

}