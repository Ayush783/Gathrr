import 'dart:developer';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';

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
