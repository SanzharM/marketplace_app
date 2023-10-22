import 'package:flutter/material.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/presentation/widgets/common/sliver_body_with_header.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverBodyWithHeader(
        title: L10n.of(context).cart,
        body: Container(),
      ),
    );
  }
}
