import 'package:auto_route/auto_route.dart';

import '../screens/rating_bar_demo_screen.dart';
import '../screens/gauge_rating_screen.dart';
import '../screens/credit_score_screen.dart';
import '../screens/star_rating_screen.dart';
import '../screens/emoji_rating_screen.dart';
import '../screens/heart_rating_screen.dart';
import '../screens/default_rating_screen.dart';
import '../screens/mood_rating_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RatingBarDemoRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/gauge',
          page: GaugeRatingRoute.page,
        ),
        AutoRoute(
          path: '/credit-score',
          page: CreditScoreRoute.page,
        ),
        AutoRoute(
          path: '/star',
          page: StarRatingRoute.page,
        ),
        AutoRoute(
          path: '/emoji',
          page: EmojiRatingRoute.page,
        ),
        AutoRoute(
          path: '/heart',
          page: HeartRatingRoute.page,
        ),
        AutoRoute(
          path: '/default',
          page: DefaultRatingRoute.page,
        ),
        AutoRoute(
          path: '/mood',
          page: MoodRatingRoute.page,
        ),
      ];
} 