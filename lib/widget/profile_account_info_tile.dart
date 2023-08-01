import 'package:flutter/material.dart';

import '../utils/constants.dart';

class GeneralAccountInfoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  const GeneralAccountInfoTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 0, vertical: defaultSpacing / 2),
        child: Image.asset(imageUrl),
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
      trailing: Icon(
        Icons.keyboard_arrow_right_rounded,
        color: fontSubHeading,
      ),
    );
  }
}

class ProfileAccountInfoTile extends StatelessWidget {
  final String iconUrl;
  final String heading;
  const ProfileAccountInfoTile(
      {super.key, required this.iconUrl, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultSpacing * 1.2),
            child: Image.asset(iconUrl, width: 40),
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
    );
  }
}
