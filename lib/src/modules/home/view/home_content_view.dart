import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/src/modules/home/model/home_api_item_model.dart';
import 'package:flutter_app/src/modules/home/model/home_highlight_model.dart';
import 'package:flutter_app/src/shared/model/app_config_model.dart';
import 'package:flutter_app/src/shared/view/feature_section_card_view.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({
    required this.highlights,
    required this.apiListAsync,
    required this.configAsync,
    required this.onSwitchLocale,
    required this.onRefreshApis,
    super.key,
  });

  final List<HomeHighlightModel> highlights;
  final AsyncValue<List<HomeApiItemModel>> apiListAsync;
  final AsyncValue<AppConfigModel> configAsync;
  final ValueChanged<String> onSwitchLocale;
  final VoidCallback onRefreshApis;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        actions: [
          IconButton(
            onPressed: onRefreshApis,
            tooltip: l10n.homeRefreshApis,
            icon: const Icon(Icons.refresh),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'en', label: Text('EN')),
                ButtonSegment(value: 'zh', label: Text('中文')),
              ],
              selected: {Localizations.localeOf(context).languageCode},
              onSelectionChanged: (value) => onSwitchLocale(value.first),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          FeatureSectionCardView(
            title: l10n.architectureTitle,
            child: Text(l10n.architectureDescription),
          ),
          const SizedBox(height: 16),
          FeatureSectionCardView(
            title: l10n.stackTitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final item in highlights) ...[
                  Text(item.title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(item.description),
                  const SizedBox(height: 12),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          FeatureSectionCardView(
            title: l10n.homeMockApisTitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.homeMockApisDescription),
                const SizedBox(height: 16),
                apiListAsync.when(
                  loading: () => const LinearProgressIndicator(),
                  error: (error, stackTrace) =>
                      Text(l10n.homeMockApisFailed(error.toString())),
                  data: (apis) => Column(
                    children: [
                      for (final api in apis) ...[
                        _HomeApiCard(api: api),
                        if (api != apis.last) const SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FeatureSectionCardView(
            title: l10n.configTitle,
            child: configAsync.when(
              loading: () => const LinearProgressIndicator(),
              error: (error, stackTrace) =>
                  Text(l10n.configLoadFailed(error.toString())),
              data: (config) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${l10n.configAppName}: ${config.appName}'),
                  Text('${l10n.configEnvironment}: ${config.environment}'),
                  Text(
                    '${l10n.configModules}: ${config.enabledModules.join(', ')}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeApiCard extends StatelessWidget {
  const _HomeApiCard({required this.api});

  final HomeApiItemModel api;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: api.method == 'POST'
                        ? const Color(0xFFD97706).withValues(alpha: 0.14)
                        : const Color(0xFF0F766E).withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    api.method,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                const Spacer(),
                Text(
                  api.latencyLabel,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(api.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(api.path, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            Text(api.summary),
          ],
        ),
      ),
    );
  }
}
