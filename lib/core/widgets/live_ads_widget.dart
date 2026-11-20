import 'package:flipkart_clone/model/home_model.dart';
import 'package:flipkart_clone/services/url_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveAdsWidget extends StatefulWidget {
  final List<LiveStreamModel> liveStreamAds;
  const LiveAdsWidget({super.key, required this.liveStreamAds});

  @override
  State<LiveAdsWidget> createState() => _LiveAdsWidgetState();
}

class _LiveAdsWidgetState extends State<LiveAdsWidget> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();
    final ad = widget.liveStreamAds.first;
    return GestureDetector(
      onTap: () => UrlService.openInBrowser(ad.streamUrl),
      child: Container(
        width: 90.w,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/ads_image.jpg', fit: BoxFit.cover),
              Positioned(
                top: 6.h,
                left: 6.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    ad.badgeText!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2.h,
                right: 2.w,
                child: GestureDetector(
                  onTap: () => setState(() => isVisible = false),
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Colors.black,
                    size: 20.w,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.h,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    ad.title,
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
