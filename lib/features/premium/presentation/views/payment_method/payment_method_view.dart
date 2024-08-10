import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_filled_button.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
import 'package:calculator_flutter_app/features/premium/domain/models/card/card_model.dart';
import 'package:calculator_flutter_app/features/premium/presentation/providers/cards_provider/cards_provider.dart';
import 'package:calculator_flutter_app/features/premium/presentation/providers/selected_card_provider/selected_card_provider.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:calculator_flutter_app/util/router/paths.dart';
import 'package:calculator_flutter_app/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodView extends ConsumerWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.watch(cardsProvider);
    final selected = ref.watch(selectedCardProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BackButtonWidget(title: 'Payment Method'),
            31.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(
                        cards.length,
                        (index) {
                          return _buildCard(
                            card: cards[index],
                            onTap: () {
                              ref.read(selectedCardProvider.notifier).state =
                                  cards[index].id;
                            },
                            isSelected: cards[index].id == selected,
                          );
                        },
                      ),
                    ),
                    24.hb,
                    InkWell(
                      borderRadius: BorderRadius.circular(10.r),
                      onTap: () {
                        GoRouter.of(context).push(RoutePaths.addCard);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 24.r,
                              color: R.colors.primary,
                            ),
                            4.wb,
                            AppText(
                              text: 'Add New Card',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: R.colors.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                    40.hb,
                    AppFilledButton(
                      text: 'Subscribe',
                      onTap: () {
                        showToast(msg: 'You have been subscribed successfully');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required CardModel card,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? R.colors.primary : R.colors.greyTextField,
          ),
          color: R.colors.greyTextField,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          leading: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Image.asset(
              card.icon,
              height: 15.h,
              width: 38.w,
            ),
          ),
          title: AppText(
            text: card.name,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          subtitle: AppText(
            text: card.number,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: R.colors.secondary.withOpacity(0.5),
          ),
          trailing: isSelected
              ? CircleAvatar(
                  radius: 12.r,
                  backgroundColor: R.colors.primary,
                  child: Icon(
                    Icons.check,
                    size: 18.r,
                    color: R.colors.white,
                  ),
                )
              : Icon(
                  Icons.radio_button_off,
                  size: 28.r,
                  color: R.colors.secondary.withOpacity(0.4),
                ),
        ),
      ),
    );
  }
}
