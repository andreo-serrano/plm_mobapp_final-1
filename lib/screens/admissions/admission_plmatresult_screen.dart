import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('PLMAT Results', style: TextStyle(fontSize: 21.0)),
              centerTitle: true,
              background: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/On1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enrollment Instructions',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromARGB(255, 0, 102, 153),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 30),
                  Text(
                    'Tuition-Free Education',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromARGB(255, 0, 102, 153),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
