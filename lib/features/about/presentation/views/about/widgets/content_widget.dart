import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/features/about/domain/models/about/content_model.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({required this.content, super.key});

  final ContentModel content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: AppText(
            text: content.title,
            fontSize: 18,
            color: R.colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        12.hb,
        AppText(
          text: content.content,
          fontSize: 14,
          color: R.colors.orange,
        ),
        12.hb,
      ],
    );
  }
}
