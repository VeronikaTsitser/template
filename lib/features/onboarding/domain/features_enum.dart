import 'package:flutter/cupertino.dart';

enum FeaturesEnum {
  //TODO
  affirmations,
  meditations,
  humanDesign,
  birthChart,
  calendar,
  compatibility,
  wisdom,
  dailyTips,
  moodJournal,
}

extension FeatureEnumExtension on FeaturesEnum {
  String get title {
    return 'title'; //TODO
    // switch (this) {
    //   case FeaturesEnum.affirmations:
    //     return S.current.affirmations;
    //   case FeaturesEnum.meditations:
    //     return S.current.meditations;
    //   case FeaturesEnum.humanDesign:
    //     return S.current.humanDesign;
    //   case FeaturesEnum.birthChart:
    //     return S.current.birthChart;
    //   case FeaturesEnum.calendar:
    //     return S.current.calendar;
    //   case FeaturesEnum.compatibility:
    //     return S.current.compatibility;
    //   case FeaturesEnum.wisdom:
    //     return S.current.wisdom;
    //   case FeaturesEnum.dailyTips:
    //     return S.current.dailyTips;
    //   case FeaturesEnum.moodJournal:
    //     return S.current.moodJournal;
    // }
  }

  IconData get icon {
    //TODO
    switch (this) {
      case FeaturesEnum.affirmations:
        return CupertinoIcons.rays;
      case FeaturesEnum.meditations:
        return CupertinoIcons.sparkles;
      case FeaturesEnum.humanDesign:
        return CupertinoIcons.eye_fill;
      case FeaturesEnum.birthChart:
        return CupertinoIcons.moon_stars_fill;
      case FeaturesEnum.calendar:
        return CupertinoIcons.calendar;
      case FeaturesEnum.compatibility:
        return CupertinoIcons.person_2_fill;
      case FeaturesEnum.wisdom:
        return CupertinoIcons.wand_stars;
      case FeaturesEnum.dailyTips:
        return CupertinoIcons.cursor_rays;
      case FeaturesEnum.moodJournal:
        return CupertinoIcons.news_solid;
    }
  }
}
