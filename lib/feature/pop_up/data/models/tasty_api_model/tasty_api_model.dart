import 'package:equatable/equatable.dart';

import 'show.dart';

class TastyApiModel extends Equatable {
  final int? approvedAt;
  final String? aspectRatio;
  final dynamic beautyUrl;
  final dynamic buzzId;
  final String? canonicalId;
  final String? country;
  final int? createdAt;
  final dynamic description;
  final String? draftStatus;
  final List<dynamic>? facebookPosts;
  final int? id;
  final bool? isShoppable;
  final dynamic keywords;
  final String? language;
  final String? name;
  final String? promotion;
  final List<Show>? show;
  final String? slug;
  final String? thumbnailAltText;
  final String? thumbnailUrl;
  final int? videoId;
  final String? videoUrl;

  const TastyApiModel({
    this.approvedAt,
    this.aspectRatio,
    this.beautyUrl,
    this.buzzId,
    this.canonicalId,
    this.country,
    this.createdAt,
    this.description,
    this.draftStatus,
    this.facebookPosts,
    this.id,
    this.isShoppable,
    this.keywords,
    this.language,
    this.name,
    this.promotion,
    this.show,
    this.slug,
    this.thumbnailAltText,
    this.thumbnailUrl,
    this.videoId,
    this.videoUrl,
  });

  factory TastyApiModel.fromJson(Map<String, dynamic> json) => TastyApiModel(
    approvedAt: json['approved_at'] as int?,
    aspectRatio: json['aspect_ratio'] as String?,
    beautyUrl: json['beauty_url'] as dynamic,
    buzzId: json['buzz_id'] as dynamic,
    canonicalId: json['canonical_id'] as String?,
    country: json['country'] as String?,
    createdAt: json['created_at'] as int?,
    description: json['description'] as dynamic,
    draftStatus: json['draft_status'] as String?,
    facebookPosts: json['facebook_posts'] as List<dynamic>?,
    id: json['id'] as int?,
    isShoppable: json['is_shoppable'] as bool?,
    keywords: json['keywords'] as dynamic,
    language: json['language'] as String?,
    name: json['name'] as String?,
    promotion: json['promotion'] as String?,
    show:
        (json['show'] as List<dynamic>?)
            ?.map((e) => Show.fromJson(e as Map<String, dynamic>))
            .toList(),
    slug: json['slug'] as String?,
    thumbnailAltText: json['thumbnail_alt_text'] as String?,
    thumbnailUrl: json['thumbnail_url'] as String?,
    videoId: json['video_id'] as int?,
    videoUrl: json['video_url'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'approved_at': approvedAt,
    'aspect_ratio': aspectRatio,
    'beauty_url': beautyUrl,
    'buzz_id': buzzId,
    'canonical_id': canonicalId,
    'country': country,
    'created_at': createdAt,
    'description': description,
    'draft_status': draftStatus,
    'facebook_posts': facebookPosts,
    'id': id,
    'is_shoppable': isShoppable,
    'keywords': keywords,
    'language': language,
    'name': name,
    'promotion': promotion,
    'show': show?.map((e) => e.toJson()).toList(),
    'slug': slug,
    'thumbnail_alt_text': thumbnailAltText,
    'thumbnail_url': thumbnailUrl,
    'video_id': videoId,
    'video_url': videoUrl,
  };

  @override
  List<Object?> get props {
    return [
      approvedAt,
      aspectRatio,
      beautyUrl,
      buzzId,
      canonicalId,
      country,
      createdAt,
      description,
      draftStatus,
      facebookPosts,
      id,
      isShoppable,
      keywords,
      language,
      name,
      promotion,
      show,
      slug,
      thumbnailAltText,
      thumbnailUrl,
      videoId,
      videoUrl,
    ];
  }
}
