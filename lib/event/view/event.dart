import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gathrr/home/model/event.dart';
import 'package:gathrr/theme/textstyles.dart/textstyles.dart';

import '../widget/event_appbar.dart';

class EventView extends StatefulWidget {
  const EventView({Key? key, this.event}) : super(key: key);

  final Event? event;

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    final devicePadding = MediaQuery.of(context).viewPadding;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EventAppbar(devicePadding: devicePadding),
            Container(
              width: size.width,
              height: size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        widget.event!.event_banner_img1!),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    )),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.event!.eventName!,
                    style: kTextstyle2.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.event!.eventDescription!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kTextstyle3.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                widget.event!.eventName!,
                style: kTextstyle2,
              ),
              subtitle: Text(
                widget.event!.eventStartdate! +
                    " | " +
                    widget.event!.eventStarttime! +
                    "-" +
                    widget.event!.eventEndtime! +
                    " | " +
                    widget.event!.eventLocation!,
                style: kTextstyle3.copyWith(color: const Color(0xffaeaeae)),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.event!.eventDescription!,
                style: kTextstyle3,
                maxLines: showMore ? null : 6,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  child: Text(
                    showMore ? 'Show less' : 'Show more',
                    style:
                        kTextstyle3.copyWith(color: Colors.green, fontSize: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.3,
                ),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return buildGridItem(gridItems[index].getTitle(),
                      gridItems[index].getIconData());
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 9,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Check In',
                        style: kTextstyle3.copyWith(color: Colors.white),
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

  Column buildGridItem(
    String title,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xffaeaeae),
          size: 36,
        ),
        Text(
          title,
          style: kTextstyle2.copyWith(
            fontSize: 16,
            color: const Color(0xffaeaeae),
          ),
        )
      ],
    );
  }
}

const gridItems = [
  GridItems.agenda,
  GridItems.attendees,
  GridItems.brands,
  GridItems.brochure,
  GridItems.location,
  GridItems.more,
  GridItems.speakers,
  GridItems.sponsors,
  GridItems.videos
];

enum GridItems {
  agenda,
  attendees,
  sponsors,
  speakers,
  brands,
  videos,
  location,
  brochure,
  more
}

extension GridItemsX on GridItems {
  IconData getIconData() {
    switch (this) {
      case GridItems.agenda:
        return Icons.timer_sharp;
      case GridItems.attendees:
        return Icons.people;
      case GridItems.brands:
        return Icons.category_outlined;
      case GridItems.brochure:
        return Icons.picture_as_pdf;
      case GridItems.location:
        return Icons.location_on_rounded;
      case GridItems.more:
        return Icons.more_horiz_outlined;
      case GridItems.speakers:
        return Icons.mic;
      case GridItems.sponsors:
        return Icons.timeline;
      case GridItems.videos:
        return Icons.video_call;
      default:
        throw Exception();
    }
  }

  String getTitle() {
    switch (this) {
      case GridItems.agenda:
        return 'Agenda';
      case GridItems.attendees:
        return 'Attendees';
      case GridItems.brands:
        return 'Brands';
      case GridItems.brochure:
        return 'Brochure';
      case GridItems.location:
        return 'Location';
      case GridItems.more:
        return 'More';
      case GridItems.speakers:
        return 'Speakers';
      case GridItems.sponsors:
        return 'Timeline';
      case GridItems.videos:
        return 'Videos';
      default:
        throw Exception();
    }
  }
}
