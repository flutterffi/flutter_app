import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/src/modules/discover/model/discover_article_model.dart';
import 'package:flutter_app/src/shared/view/feature_section_card_view.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({
    required this.articleAsync,
    required this.onRefresh,
    super.key,
  });

  final AsyncValue<DiscoverArticleModel> articleAsync;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.discoverTitle),
        actions: [
          IconButton(
            onPressed: onRefresh,
            tooltip: l10n.homeRefreshApis,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          FeatureSectionCardView(
            title: l10n.discoverFeaturedTitle,
            child: articleAsync.when(
              loading: () => const LinearProgressIndicator(),
              error: (error, stackTrace) =>
                  Text(l10n.discoverLoadFailed(error.toString())),
              data: (article) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(article.body),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _MetaChip(label: article.endpointPath),
                      _MetaChip(label: article.sourceLabel),
                    ],
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

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(label),
      ),
    );
  }
}
