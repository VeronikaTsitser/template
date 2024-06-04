import 'package:archi_explorer/features/onboarding/domain/models/carousel_item_model.dart';

final List<CarouselItemModel> carouselItemsList = [
  CarouselItemModel(
    pageIndex: 0,
    imagePath: 'assets/images/onboarding_1.png',
    title: 'Добро пожаловать',
    description:
        'Приветствуем вас. Мы уверены, что наше приложение поможет вам легко и удобно сохранить все моменты, которые для вас дороги.',
  ),
  CarouselItemModel(
    pageIndex: 1,
    imagePath: 'assets/images/onboarding_2.png',
    title: 'Не теряйте',
    description:
        'Описывайте события, добавляйте фотографии, быстро находите важные моменты. Используйте приложение независимо от наличия интернета.',
  )
];
