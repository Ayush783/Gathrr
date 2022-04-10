import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gathrr/home/model/event.dart';
import 'package:gathrr/home/widget/carousel.dart';
import 'package:gathrr/theme/theme.dart';

import '../bloc/home_bloc.dart';
import '../widget/home_appbar.dart';
import '../widget/live_event_card.dart';
import '../widget/past_event_listview.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  'Do you want to exit the application',
                  style: kTextstyle3,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        false,
                      );
                    },
                    child: Text(
                      'No',
                      style: kTextstyle3,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        true,
                      );
                    },
                    child: Text(
                      'Yes',
                      style: kTextstyle3,
                    ),
                  )
                ],
              );
            });
        return result;
      },
      child: BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeViewBody(),
      ),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeAppbar(),
                  const SizedBox(height: 24),
                  const LiveEventCard(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Upcoming Events',
                      style: kTextstyle2.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Carousel(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CarouselIndicators(),
                    ],
                  ),
                  const SizedBox(height: 0),
                  const PastEventsListView()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
