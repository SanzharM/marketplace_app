import 'package:flutter/widgets.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/widgets/common/sliver_body_with_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverBodyWithHeader(
      title: L10n.of(context).profile,
      body: Container(),
    );
  }
}
