class HomeModel {
  final bool success;
  final String status;
  final String message;
  final HomeData data;

  HomeModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      success: json['success'] ?? false,
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: HomeData.fromJson(json['data'] ?? {}),
    );
  }
}

class HomeData {
  final String deliveryAddress;
  final int supercoinBalance;
  final SearchModel search;
  final List<ServiceTab> serviceTabs;
  final List<CategoryModel> categories;
  final List<BannerModel> banners;
  final List<ProductModel> adProducts;
  final List<ProductModel> suggestedForYou;
  final List<LiveStreamModel> liveStreams;
  final List<BottomNavModel> bottomNav;

  HomeData({
    required this.deliveryAddress,
    required this.supercoinBalance,
    required this.search,
    required this.serviceTabs,
    required this.categories,
    required this.banners,
    required this.adProducts,
    required this.suggestedForYou,
    required this.liveStreams,
    required this.bottomNav,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      deliveryAddress: json['delivery_address'] ?? '',
      supercoinBalance: json['supercoin_balance'] ?? 0,
      search: SearchModel.fromJson(json['search'] ?? {}),
      serviceTabs: (json['service_tabs'] as List? ?? [])
          .map((e) => ServiceTab.fromJson(e))
          .toList(),
      categories: (json['categories'] as List? ?? [])
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      banners: (json['banners'] as List? ?? [])
          .map((e) => BannerModel.fromJson(e))
          .toList(),
      adProducts: (json['ad_products'] as List? ?? [])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      suggestedForYou: (json['suggested_for_you'] as List? ?? [])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      liveStreams: (json['live_streams'] as List? ?? [])
          .map((e) => LiveStreamModel.fromJson(e))
          .toList(),
      bottomNav: (json['bottom_nav'] as List? ?? [])
          .map((e) => BottomNavModel.fromJson(e))
          .toList(),
    );
  }
}

class SearchModel {
  final String placeholder;
  final bool voiceEnabled;
  final bool scanEnabled;

  SearchModel({
    required this.placeholder,
    required this.voiceEnabled,
    required this.scanEnabled,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      placeholder: json['placeholder'] ?? '',
      voiceEnabled: json['voice_enabled'] ?? false,
      scanEnabled: json['scan_enabled'] ?? false,
    );
  }
}

class ServiceTab {
  final int id;
  final String name;
  final String slug;
  final String? badgeText;
  final bool isSelected;
  final int sortOrder;
  final bool status;
  final String? iconUrl;

  ServiceTab({
    required this.id,
    required this.name,
    required this.slug,
    this.badgeText,
    required this.isSelected,
    required this.sortOrder,
    required this.status,
    this.iconUrl,
  });

  factory ServiceTab.fromJson(Map<String, dynamic> json) {
    return ServiceTab(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      badgeText: json['badge_text'],
      isSelected: json['is_selected'] ?? false,
      sortOrder: json['sort_order'] ?? 0,
      status: json['status'] ?? false,
      iconUrl: json['icon_url'],
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final bool isSelected;
  final int sortOrder;
  final bool status;
  final String? iconUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.isSelected,
    required this.sortOrder,
    required this.status,
    this.iconUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      isSelected: json['is_selected'] ?? false,
      sortOrder: json['sort_order'] ?? 0,
      status: json['status'] ?? false,
      iconUrl: json['icon_url'],
    );
  }
}

class BannerModel {
  final int id;
  final String? tagText;
  final String title;
  final String? subtitle;
  final String? offerText;
  final String? brandLabel;
  final String? termsText;
  final String redirectUrl;
  final int sortOrder;
  final bool status;
  final String? imageUrl;

  BannerModel({
    required this.id,
    this.tagText,
    required this.title,
    this.subtitle,
    this.offerText,
    this.brandLabel,
    this.termsText,
    required this.redirectUrl,
    required this.sortOrder,
    required this.status,
    this.imageUrl,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? 0,
      tagText: json['tag_text'],
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      offerText: json['offer_text'],
      brandLabel: json['brand_label'],
      termsText: json['terms_text'],
      redirectUrl: json['redirect_url'] ?? '',
      sortOrder: json['sort_order'] ?? 0,
      status: json['status'] ?? false,
      imageUrl: json['image_url'],
    );
  }
}

class ProductModel {
  final int id;
  final String? brand;
  final String name;
  final String? ctaText;
  final bool isAd;
  final String? redirectUrl;
  final int sortOrder;
  final bool status;
  final int? categoryId;
  final double? rating;
  final int? ratingCount;
  final int? price;
  final int? mrp;
  final int? discountPercent;
  final bool? isSuggested;
  final String? categoryName;
  final String? categorySlug;
  final String? imageUrl;

  ProductModel({
    required this.id,
    this.brand,
    required this.name,
    this.ctaText,
    this.isAd = false,
    this.redirectUrl,
    required this.sortOrder,
    required this.status,
    this.categoryId,
    this.rating,
    this.ratingCount,
    this.price,
    this.mrp,
    this.discountPercent,
    this.isSuggested,
    this.categoryName,
    this.categorySlug,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      brand: json['brand'],
      name: json['product_name'] ?? json['name'] ?? '',
      ctaText: json['cta_text'],
      isAd: json['is_ad'] ?? false,
      redirectUrl: json['redirect_url'],
      sortOrder: json['sort_order'] ?? 0,
      status: json['status'] ?? false,
      categoryId: json['category_id'],
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: json['rating_count'],
      price: json['price'],
      mrp: json['mrp'],
      discountPercent: json['discount_percent'],
      isSuggested: json['is_suggested'],
      categoryName: json['category_name'],
      categorySlug: json['category_slug'],
      imageUrl: json['image_url'],
    );
  }
}

class LiveStreamModel {
  final int id;
  final String title;
  final String? badgeText;
  final String? offerText;
  final bool isLive;
  final String streamUrl;
  final bool status;
  final String? thumbnailUrl;

  LiveStreamModel({
    required this.id,
    required this.title,
    this.badgeText,
    this.offerText,
    required this.isLive,
    required this.streamUrl,
    required this.status,
    this.thumbnailUrl,
  });

  factory LiveStreamModel.fromJson(Map<String, dynamic> json) {
    return LiveStreamModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      badgeText: json['badge_text'],
      offerText: json['offer_text'],
      isLive: json['is_live'] ?? false,
      streamUrl: json['stream_url'] ?? '',
      status: json['status'] ?? false,
      thumbnailUrl: json['thumbnail_url'],
    );
  }
}

class BottomNavModel {
  final int id;
  final String label;
  final String slug;
  final bool isSelected;
  final int sortOrder;
  final bool status;
  final String? iconUrl;

  BottomNavModel({
    required this.id,
    required this.label,
    required this.slug,
    required this.isSelected,
    required this.sortOrder,
    required this.status,
    this.iconUrl,
  });

  factory BottomNavModel.fromJson(Map<String, dynamic> json) {
    return BottomNavModel(
      id: json['id'] ?? 0,
      label: json['label'] ?? '',
      slug: json['slug'] ?? '',
      isSelected: json['is_selected'] ?? false,
      sortOrder: json['sort_order'] ?? 0,
      status: json['status'] ?? false,
      iconUrl: json['icon_url'],
    );
  }
}
