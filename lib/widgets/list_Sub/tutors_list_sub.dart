import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../../screen/Profile/profile_public.dart';

class TutorsListSub extends StatelessWidget {
  const TutorsListSub({super.key, required this.tutor});
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30.0,
        backgroundColor: colorScheme.background,
        backgroundImage: NetworkImage(tutor.profileImageUrl),
      ),
      title: Text(
        tutor.name,
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Text(
            tutor.category,
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orangeAccent,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                tutor.rating.toString(),
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onBackground.withOpacity(.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Icon(
                Icons.work,
                color: colorScheme.tertiary,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "3 Years",
                style: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onBackground.withOpacity(.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: FilledButton(
        onPressed: () {
          Navigator.pushNamed(context, "/ProfilePublic");
        },
        child: const Text("Book Now"),
      ),
    );
  }
}
