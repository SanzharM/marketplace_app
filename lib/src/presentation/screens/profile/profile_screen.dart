import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_app/src/common/state_status.dart';
import 'package:marketplace_app/src/core/app_router/app_router.dart';
import 'package:marketplace_app/src/core/extensions/extensions.dart';
import 'package:marketplace_app/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:marketplace_app/src/core/l10n/l10n_service.dart';
import 'package:marketplace_app/src/core/utils/utils.dart';
import 'package:marketplace_app/src/presentation/screens/profile/bloc/user_bloc.dart';
import 'package:marketplace_app/src/presentation/screens/profile/components/unauthorized_profile_widget.dart';
import 'package:marketplace_app/src/presentation/widgets/buttons/app_icon_button.dart';
import 'package:marketplace_app/src/presentation/widgets/common/sliver_body_with_header.dart';
import 'package:marketplace_app/src/presentation/widgets/loader/custom_loader.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.status.isError) {
          return context.showSnackBar(state.message);
        }
      },
      builder: (context, state) {
        Widget getChild() {
          if (state.status.isLoading) {
            return const CustomLoader();
          }
          if (state.isAuthorized) {
            return Container();
          }
          return const UnauthorizedProfileWidget();
        }

        return SliverBodyWithHeader(
          title: L10n.of(context).profile,
          body: AnimatedSwitcher(
            duration: Utils.animationDuration,
            child: getChild(),
          ),
          actions: [
            AppIconButton(
              icon: Assets.icons.settings.svg(),
              onPressed: () {
                context.router.push<void>(const SettingsRoute());
              },
            ),
          ],
        );
      },
    );
  }
}
