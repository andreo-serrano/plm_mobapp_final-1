import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSliverAppBar extends StatelessWidget {
  String text = '';
  String image = 'assets/images/plmimage.png';
  Widget? child;
  bool isCenter;

  CustomSliverAppBar({super.key, 
    required this.text,
    required this.image,
    required this.child,
    required this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35.0),
              bottomRight: Radius.circular(35.0),
            ),
          ),
          pinned: true,
          expandedHeight: 180.0,
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0),
                  ),
                ),
              ),
              FlexibleSpaceBar(
                title: Text(
                  text,
                  style: const TextStyle(fontSize: 21.0),
                ),
                centerTitle: isCenter,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: child),
      ],
    );
  }
}
