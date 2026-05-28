import 'package:flutter/material.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/src/core/constants/app_spacing.dart';
import 'package:flutter_app/src/modules/profile/model/profile_model.dart';
import 'package:flutter_app/src/shared/view/feature_section_card_view.dart';
import 'package:flutter_app/src/shared/widgets/app_button.dart';
import 'package:flutter_app/src/shared/widgets/app_error_view.dart';
import 'package:flutter_app/src/shared/widgets/app_text_field.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    required this.model,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onTogglePasswordVisibility,
    required this.onSubmit,
    required this.onLogout,
    super.key,
  });

  final ProfileModel model;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onSubmit;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          FeatureSectionCardView(
            title: model.title,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.subtitle),
                const SizedBox(height: AppSpacing.md),
                if (model.isLoggedIn) ...[
                  Text(
                    l10n.profileWelcome(model.email),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppButton(
                    isTonal: true,
                    onPressed: onLogout,
                    label: l10n.profileLogout,
                  ),
                ] else ...[
                  AppTextField(
                    fieldKey: const Key('profile_email_field'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: onEmailChanged,
                    label: l10n.profileEmailLabel,
                    hintText: 'name@example.com',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  AppTextField(
                    fieldKey: const Key('profile_password_field'),
                    obscureText: !model.isPasswordVisible,
                    onChanged: onPasswordChanged,
                    label: l10n.profilePasswordLabel,
                    suffixIcon: IconButton(
                      onPressed: onTogglePasswordVisibility,
                      icon: Icon(
                        model.isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  if (model.errorMessage case final message?) ...[
                    const SizedBox(height: AppSpacing.sm),
                    AppErrorView(message: message),
                  ],
                  const SizedBox(height: AppSpacing.md),
                  AppButton(
                    isExpanded: true,
                    onPressed: onSubmit,
                    label: l10n.profileLogin,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
