import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gathrr/event/event.dart';
import 'package:gathrr/home/bloc/home_bloc.dart';
import 'package:gathrr/home/model/event.dart';
import 'package:gathrr/theme/theme.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  static final PageController _controller =
      PageController(initialPage: 1, viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final upcomingEvents = context.select((HomeBloc bloc) => bloc.state.events
        .where((e) => e.getEventType() == EventType.upcoming)
        .toList());
    final isLoading = context.select((HomeBloc bloc) => bloc.state.isLoading);
    final hasError = context.select((HomeBloc bloc) => bloc.state.hasError);

    return SizedBox(
      width: size.width,
      height: size.height.toInt() <= 640 ? size.height / 3 : size.height / 4,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (val) {
                context.read<HomeBloc>().add(CarouselSwipe(val));
              },
              itemBuilder: (context, index) {
                if (isLoading) {
                  return const CarouselItem.loading();
                } else {
                  if (hasError) {
                    return const CarouselItem.error();
                  } else {
                    return CarouselItem(
                      title: upcomingEvents[index].eventName,
                      img: upcomingEvents[index].event_banner_img1,
                      link: upcomingEvents[index].isBooking,
                      event: upcomingEvents[index],
                    );
                  }
                }
              },
              itemCount: isLoading || hasError ? 3 : upcomingEvents.length,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem(
      {Key? key,
      this.title,
      this.img,
      this.link,
      this.isLoading = false,
      this.event,
      this.hasError = false})
      : super(key: key);

  final String? title, img, link;
  final bool isLoading, hasError;
  final Event? event;

  const CarouselItem.loading()
      : title = 'Loading...',
        img = '',
        link = '',
        isLoading = true,
        event = null,
        hasError = false;
  const CarouselItem.error()
      : title = '',
        img = '',
        link = '',
        event = null,
        isLoading = false,
        hasError = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: hasError || isLoading
              ? const BoxDecoration()
              : BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      img!,
                    ),
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
          padding: const EdgeInsets.all(24.0),
          child: hasError
              ? const Center(
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: Colors.red,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kTextstyle2.copyWith(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        log(img!);
                        if (!isLoading || !hasError) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventView(
                                event: event!,
                              ),
                            ),
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffffff00),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Book now',
                        style: kTextstyle3,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

//carousel indicators
class CarouselIndicators extends StatelessWidget {
  const CarouselIndicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((HomeBloc bloc) => bloc.state.isLoading);
    final hasError = context.select((HomeBloc bloc) => bloc.state.hasError);
    final events = context.select((HomeBloc bloc) =>
        bloc.state.events.where((e) => e.getEventType() == EventType.upcoming));
    final index = context.select((HomeBloc bloc) => bloc.state.carouselIndex);
    return Row(
      children: [
        for (var i = 0; isLoading || hasError ? i < 3 : i < events.length; i++)
          Container(
            width: i == index ? 10 : 8,
            height: i == index ? 10 : 8,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == index ? Colors.black : const Color(0xffd2d2d2),
            ),
          ),
      ],
    );
  }
}
