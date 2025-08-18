import 'package:facebook_clone/core/routes/app_routes.dart';
import 'package:facebook_clone/core/widgets/buttons/custom_eleveted_button.dart';
import 'package:facebook_clone/core/widgets/iconButton/custom_icon_button.dart';
import 'package:facebook_clone/core/widgets/profilecard/profile_card.dart';
import 'package:facebook_clone/features/auth/viewModel/saved_accounts_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SavedAccounts extends StatelessWidget {
  const SavedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    final savedAccount = context.watch<SavedAccountsViewModel>();
    return Consumer<SavedAccountsViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          body: SafeArea(
            child: savedAccount.isLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      spacing: 20,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomIconButton(
                            icon: Icons.more_horiz,
                            onPressed: () {
                              showModalBottomSheet(
                                showDragHandle: true,
                                context: context,
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          CustomIconButton(
                                            icon: FontAwesomeIcons.xmark,
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          const Spacer(flex: 2),
                                          Text(
                                            "Profiles",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleLarge,
                                          ),
                                          const Spacer(flex: 3),
                                        ],
                                      ),
                                      CustomElevetedButton(
                                        isCreateAccount: true,
                                        title:
                                            "Remove profiles from this device",
                                        onPressed: () {
                                          viewModel.removeAllAccounts();
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Icon(
                          FontAwesomeIcons.facebook,
                          color: Color(0xff0866ff),
                          size: 50,
                        ),
                        Expanded(
                          child: viewModel.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : viewModel.accounts.isEmpty
                              ? const SizedBox.shrink()
                              : ListView.builder(
                                  itemCount: viewModel.accounts.length,
                                  itemBuilder: (context, index) {
                                    final account = viewModel.accounts[index];
                                    return GestureDetector(
                                      onTap: () =>
                                          viewModel.onAccountTap(account),
                                      child: ProfileCard(
                                        name: account.name,
                                        image: account.profileImage ?? "",
                                      ),
                                    );
                                  },
                                ),
                        ),
                        CustomElevetedButton(
                          title: "Use another account",
                          onPressed: () =>
                              GoRouter.of(context).push(AppRouteNames.login),
                        ),
                        CustomElevetedButton(
                          title: "Create New Account",
                          onPressed: () =>
                              GoRouter.of(context).push(AppRouteNames.register),
                          isCreateAccount: true,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
