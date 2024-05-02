import 'package:flutter/material.dart';

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
    Navigator.pushNamed(context, '/signupScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome"),
            const SizedBox(height: 4.0),
            GestureDetector(onTap: openSignupScreen, child: const Text("Amer")),
            const SizedBox(height: 4.0),
            const Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.blueGrey,
                ),
                SizedBox(width: 4.0),
                Text("Dubai, UAE"),
                SizedBox(width: 4.0),
                Icon(
                  Icons.expand_more,
                  color: Colors.blueGrey,
                ),
              ],
            )
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
                  child: const Icon(Icons.filter_alt_outlined,
                      color: Colors.blueGrey),
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
    return const Column(
      children: [],
    );
  }
}
