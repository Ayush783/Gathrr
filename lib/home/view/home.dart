import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gathrr/home/widget/carousel.dart';
import 'package:gathrr/theme/theme.dart';

import '../bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeViewBody(),
    );
  }
}

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetEvents());
  }

  @override
  Widget build(BuildContext context) {
    final devicePadding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height / 2,
            width: size.width,
            color: const Color(0xff02b140),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              devicePadding.left,
              devicePadding.top,
              devicePadding.right,
              devicePadding.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppbar(),
                const SizedBox(height: 24),
                LiveEventCard(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Upcoming Events',
                    style: kTextstyle2.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
                Carousel(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CarouselIndicators(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LiveEventCard extends StatelessWidget {
  const LiveEventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Event title',
                      style: kTextstyle2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'another text',
                      style: kTextstyle3.copyWith(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'another text',
                      style: kTextstyle3,
                    ),
                    const SizedBox(height: 4),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff02b140),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          )),
                      child: Text(
                        'Join now',
                        style: kTextstyle3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Chip(
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      backgroundColor: Colors.red,
                      label: Text(
                        'Live ⚪',
                        style: kTextstyle3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'Home',
            style: kTextstyle1,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              log('notification pressed');
            },
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              log('menu pressed');
            },
            constraints: const BoxConstraints(),
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
