import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class EventAppbar extends StatelessWidget {
  const EventAppbar({
    Key? key,
    required this.devicePadding,
  }) : super(key: key);

  final EdgeInsets devicePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xff02b140), boxShadow: [
        BoxShadow(
          offset: const Offset(0, 2),
          blurRadius: 4,
          color: Colors.black.withOpacity(0.4),
        )
      ]),
      padding: EdgeInsets.fromLTRB(16, devicePadding.top, 16, 0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(8),
          ),
          Text(
            'Event Details',
            style: kTextstyle2.copyWith(
              color: Colors.white,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(8),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.white,
            ),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(8),
          )
        ],
      ),
    );
  }
}
