import 'dart:math';

import 'package:firebaseconnations/main.dart';
import 'package:firebaseconnations/widgets/Avatars/subject_avatar_with_text.dart';
import 'package:firebaseconnations/widgets/title/section_title.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../widgets/card/bookings_preview_card.dart';
import '../widgets/list_Sub/tutors_list_sub.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void openSignupScreen() {
    Navigator.pushNamed(context, '/ProfilePrivet');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 4.0),
            GestureDetector(
                onTap: openSignupScreen,
                child: Text(
                  "Amer Al Aloush",
                  style: textTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 4.0),
            /* Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: colorScheme.secondary,
                ),
                const SizedBox(width: 4.0),
                Text(
                  "Dubai, UAE",
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 4.0),
                Icon(
                  Icons.expand_more,
                  color: colorScheme.secondary,
                ),
              ],
            )*/
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          const SizedBox(width: 8.0),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search for Tutors...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(Icons.filter_alt_outlined,
                      color: colorScheme.surfaceVariant),
                ),
              ),
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _TutorCategories(),
            SizedBox(height: 24.0),
            _MyBookings(),
            SizedBox(height: 24.0),
            _TopTutors(),
          ],
        ),
      ),
    );
  }
}

class _TutorCategories extends StatelessWidget {
  const _TutorCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Title
        SectionTitle(
          title: 'Categories',
          action: 'see all',
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: TutorCategories.values
              .take(5)
              .map(
                (category) => Expanded(
                  child: SubjectAvatarWithTextLabel(
                      icon: category.icon, label: category.name),
                ),
              )
              .toList(),
        ),
        //
      ],
    );
  }
}

class _MyBookings extends StatelessWidget {
  const _MyBookings();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'My Bookings',
          action: "See all",
          onPressed: () {},
        ),
        const BookingsPreviewCard(),
      ],
    );
  }
}

class _TopTutors extends StatefulWidget {
  const _TopTutors();

  @override
  State<_TopTutors> createState() => _TopTutorsState();
}

class _TopTutorsState extends State<_TopTutors> {
  List<Tutor> _tutor = [];

  final rnd = Random();
  @override
  void initState() {
    _loadTutors();
    super.initState();
  }

  _loadTutors() async {
    //ToDo: Fetch the list of Tutors
    final tutor = await tutorRepository.fetchTutors();
    setState(() {
      _tutor = tutor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SectionTitle(
          title: "Top Tutors",
          action: "See all",
          onPressed: () {},
        ),
        const SizedBox(
          height: 16.0,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider(
              height: 24.0,
              color: colorScheme.surfaceVariant,
            );
          },
          itemCount: _tutor.length,
          itemBuilder: (context, index) {
            final tutor = _tutor[index];
            return TutorsListSub(tutor: tutor);
          },
        )
      ],
    );
  }
}
