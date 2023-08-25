import 'package:flutter/material.dart';

import '../utils/constants.dart';

class GeneralAccountInfoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icono;
  const GeneralAccountInfoTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icono});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 0, vertical: defaultSpacing / 2),
        child: Icon(
          icono,
          size: 40,
        ),
      ),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: fontHeading)),
      subtitle: Text(subTitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: fontSubHeading)),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
        color: fontSubHeading,
      ),
    );
  }
}

class ProfileAccountInfoTile extends StatelessWidget {
  final IconData icono;
  final String heading;
  final VoidCallback? onTap;
  const ProfileAccountInfoTile({
    super.key,
    required this.icono,
    required this.heading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultSpacing, vertical: defaultSpacing / 2),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: defaultSpacing * 1.2),
              child: Icon(
                icono,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
              child: Text(heading,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: fontHeading)),
            ),
            const Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: defaultSpacing),
                      child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: fontSubHeading,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
