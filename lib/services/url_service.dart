import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  static Future<void> openInBrowser(String? link) async {
    if (link == null || link.trim().isEmpty) return;

    final uri = Uri.tryParse(link.trim());
    if (uri == null) return;

    try {
      final opened = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // default browser mein khulega
      );
      if (!opened) debugPrint('Could not launch $link');
    } catch (e) {
      debugPrint('Launch error: $e');
    }
  }
}
