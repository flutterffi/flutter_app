import 'package:flutter/material.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/src/modules/profile/model/profile_model.dart';
import 'package:flutter_app/src/shared/view/feature_section_card_view.dart';

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
                const SizedBox(height: 16),
                if (model.isLoggedIn) ...[
                  Text(
                    l10n.profileWelcome(model.email),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.tonal(
                    onPressed: onLogout,
                    child: Text(l10n.profileLogout),
                  ),
                ] else ...[
                  TextField(
                    key: const Key('profile_email_field'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: onEmailChanged,
                    decoration: InputDecoration(
                      labelText: l10n.profileEmailLabel,
                      hintText: 'name@example.com',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    key: const Key('profile_password_field'),
                    obscureText: !model.isPasswordVisible,
                    onChanged: onPasswordChanged,
                    decoration: InputDecoration(
                      labelText: l10n.profilePasswordLabel,
                      suffixIcon: IconButton(
                        onPressed: onTogglePasswordVisibility,
                        icon: Icon(
                          model.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  if (model.errorMessage case final message?) ...[
                    const SizedBox(height: 12),
                    Text(
                      message,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: onSubmit,
                    child: Text(l10n.profileLogin),
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
