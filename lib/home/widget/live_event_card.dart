import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gathrr/event/event.dart';
import 'package:gathrr/home/bloc/home_bloc.dart';

import '../../theme/theme.dart';

class LiveEventCard extends StatelessWidget {
  const LiveEventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = context.select((HomeBloc bloc) => bloc.state.events);
    final isLoading = context.select((HomeBloc bloc) => bloc.state.isLoading);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isLoading
                          ? 'Loading...'
                          : events
                              .firstWhere((element) => element.eventId == 6)
                              .eventName!,
                      style: kTextstyle2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isLoading
                          ? ''
                          : events
                              .firstWhere((element) => element.eventId == 6)
                              .eventStartdate!,
                      style:
                          kTextstyle3.copyWith(color: const Color(0xffd2d2d2)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isLoading
                          ? '.....'
                          : events
                              .firstWhere((element) => element.eventId == 6)
                              .eventDescription!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: kTextstyle3,
                    ),
                    const SizedBox(height: 4),
                    TextButton(
                      onPressed: () {
                        if (!isLoading) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EventView(
                                event: events.firstWhere(
                                    (element) => element.eventId == 6),
                              ),
                            ),
                          );
                        }
                      },
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
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 204,
                    decoration: isLoading
                        ? const BoxDecoration()
                        : BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(events
                                  .firstWhere((element) => element.eventId == 6)
                                  .event_banner_img1!),
                              fit: BoxFit.fill,
                            ),
                          ),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
