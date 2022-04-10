import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gathrr/event/event.dart';

import '../../theme/theme.dart';
import '../bloc/home_bloc.dart';
import '../model/event.dart';

class PastEventsListView extends StatelessWidget {
  const PastEventsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pastEvents = context.select(
      (HomeBloc bloc) => bloc.state.events
          .where((element) => element.getEventType() == EventType.past)
          .toList(),
    );
    final isLoading = context.select((HomeBloc bloc) => bloc.state.isLoading);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.9,
          mainAxisSpacing: 8,
        ),
        padding: const EdgeInsets.symmetric(vertical: 24),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: size.width,
                decoration: isLoading
                    ? const BoxDecoration()
                    : BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                pastEvents[index].event_banner_img1!),
                            fit: BoxFit.fill),
                      ),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isLoading
                                  ? 'Loading...'
                                  : pastEvents[index].eventName!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kTextstyle2.copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: Colors.green,
                                  size: 14,
                                ),
                                Text(
                                  'Attended on',
                                  style: kTextstyle3.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              pastEvents[index].eventEnddate!,
                              style: kTextstyle3.copyWith(
                                color: const Color(0xffd2d2d2),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                if (!isLoading) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EventView(event: pastEvents[index]),
                                    ),
                                  );
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xffff5722),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16)),
                              child: Text(
                                'View takeaways',
                                style:
                                    kTextstyle3.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: isLoading ? 0 : pastEvents.length,
        shrinkWrap: true,
      ),
    );
  }
}
