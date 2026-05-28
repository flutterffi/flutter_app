import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/src/core/constants/app_radius.dart';
import 'package:flutter_app/src/core/constants/app_spacing.dart';
import 'package:flutter_app/src/core/extensions/build_context_extension.dart';
import 'package:flutter_app/src/core/theme/app_colors.dart';
import 'package:flutter_app/src/core/widgets/app_content_container.dart';
import 'package:flutter_app/src/modules/home/model/home_app_config_model.dart';
import 'package:flutter_app/src/modules/home/model/home_api_item_model.dart';
import 'package:flutter_app/src/modules/home/model/home_highlight_model.dart';
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
  final AsyncValue<HomeAppConfigModel> configAsync;
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
        padding: context.pagePadding(),
        children: [
          AppContentContainer(
            child: Column(
              children: [
                FeatureSectionCardView(
                  title: l10n.architectureTitle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Assets.branding.appIcon.image(
                            width: context.adaptiveSpace(42),
                            height: context.adaptiveSpace(42),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(child: Text(l10n.architectureDescription)),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      ClipRRect(
                        borderRadius: AppRadius.mediumValue,
                        child: Assets.images.illustrations.homeHero.image(
                          height: context.responsiveValue(
                            132,
                            medium: 180,
                            expanded: 220,
                          ),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                FeatureSectionCardView(
                  title: l10n.stackTitle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final item in highlights) ...[
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(item.description),
                        const SizedBox(height: AppSpacing.sm),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                FeatureSectionCardView(
                  title: l10n.homeMockApisTitle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.homeMockApisDescription),
                      const SizedBox(height: AppSpacing.md),
                      apiListAsync.when(
                        loading: () => const LinearProgressIndicator(),
                        error: (error, stackTrace) =>
                            Text(l10n.homeMockApisFailed(error.toString())),
                        data: (apis) => Column(
                          children: [
                            for (final api in apis) ...[
                              _HomeApiCard(api: api),
                              if (api != apis.last)
                                const SizedBox(height: AppSpacing.sm),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
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
        borderRadius: AppRadius.mediumValue,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs + 2,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: api.method == 'POST'
                        ? AppColors.overlay(AppColors.accent)
                        : AppColors.overlay(AppColors.primary),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppRadius.pill),
                    ),
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
            const SizedBox(height: AppSpacing.sm),
            Text(api.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.xxs),
            Text(api.path, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: AppSpacing.xs),
            Text(api.summary),
          ],
        ),
      ),
    );
  }
}
