import 'package:flutter/material.dart';

import 'package:flutter_app/src/core/extensions/build_context_extension.dart';

class AppContentContainer extends StatelessWidget {
  const AppContentContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: context.contentMaxWidth),
        child: child,
      ),
    );
  }
}
