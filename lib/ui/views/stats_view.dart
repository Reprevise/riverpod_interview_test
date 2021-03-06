import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/stats_provider.dart';
import '../shared/platform_btn.dart';
import '../shared/space.dart';
import '../shared/stat_display.dart';
import '../shared/theme.dart';

final statsProvider = ChangeNotifierProvider<StatsProvider>(
  (ref) => StatsProvider(),
);

class StatsView extends HookWidget {
  const StatsView({Key? key}) : super(key: key);

  final br32Top = const BorderRadius.vertical(
    top: Radius.circular(32),
  );

  @override
  Widget build(BuildContext context) {
    final statsP = useProvider(statsProvider);
    final controller = useTextEditingController();

    Widget buildPlatforms() {
      final platforms = statsP.delegate.supportedPlatforms;
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: space(
          8.0,
          platforms
              .map(
                (e) => PlatformButton(
                  onTap: () => statsP.changePlatform(e),
                  selectedPlatform: statsP.platform,
                  platform: e,
                ),
              )
              .toList(),
        ),
      );
    }

    Widget buildMessage(String text) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Text(
              text,
              style: const TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget buildResults() {
      if (statsP.isLoading) {
        return const Center(child: CircularProgressIndicator.adaptive());
      }
      if (statsP.error != null) {
        return buildMessage(statsP.error!);
      }
      if (statsP.noResults || statsP.stats == null) {
        return buildMessage('No Results');
      }
      return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Overall',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            primary: false,
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: statsP.overallStats!.stats.values
                .map((e) => StatDisplay(value: e))
                .toList(),
          ),
        ],
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              TabBar(
                onTap: (newValue) => statsP.changeStatType(newValue),
                tabs: const [
                  Tab(text: 'Fortnite'),
                  Tab(text: 'Apex Legends'),
                  Tab(text: 'Rocket League'),
                ],
                indicatorColor: gold,
                labelStyle: textTheme.subtitle2,
                isScrollable: true,
              ),
              const SizedBox(height: 8.0),
              Card(
                color: grey,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: br32Top,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Lookup Player',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      buildPlatforms(),
                      const SizedBox(height: 16),
                      TextField(
                        controller: controller,
                        onSubmitted: statsP.fetchStats,
                        autocorrect: false,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search username',
                          filled: true,
                          fillColor: lightGrey,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: darkGrey,
                  ),
                  child: buildResults(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
