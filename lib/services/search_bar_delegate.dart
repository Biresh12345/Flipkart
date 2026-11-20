import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final ValueNotifier<bool> isPinned;

  SearchBarDelegate({required this.child, required this.isPinned});

  @override
  double get minExtent => 145.h;

  @override
  double get maxExtent => 145.h;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ValueListenableBuilder<bool>(
      valueListenable: isPinned,
      builder: (context, pinned, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: pinned
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.8, 1.0],
                    colors: [Colors.red, Colors.white, Colors.white],
                  )
                : null,
          ),
          child: child,
        );
      },
    );
  }

  @override
  bool shouldRebuild(covariant SearchBarDelegate oldDelegate) => true;
}
