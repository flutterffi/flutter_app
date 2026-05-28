import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/src/modules/home/model/home_highlight_model.dart';
import 'package:flutter_app/src/shared/model/app_config_model.dart';
import 'package:flutter_app/src/shared/view/feature_section_card_view.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({
    required this.highlights,
    required this.configAsync,
    required this.onSwitchLocale,
    super.key,
  });

  final List<HomeHighlightModel> highlights;
  final AsyncValue<AppConfigModel> configAsync;
  final ValueChanged<String> onSwitchLocale;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        actions: [
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
