import 'package:diesel_powered/features/premium/domain/models/card/card_model.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardsProvider = StateProvider((ref) {
  return [
    CardModel(
      id: 1,
      type: 'Gpay',
      name: 'Alex Jordan',
      icon: Assets.pngs.gpay.path,
      number: '**** **** **** **68',
    ),
    CardModel(
      id: 2,
      type: 'Visa',
      name: 'Alex Jordan',
      icon: Assets.pngs.visa.path,
      number: '**** **** **** **68',
    ),
    CardModel(
      id: 3,
      type: 'Mastercard',
      name: 'Alex Jordan',
      icon: Assets.pngs.mastercard.path,
      number: '**** **** **** **68',
    ),
  ];
});
