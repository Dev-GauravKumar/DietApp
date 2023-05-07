import 'package:carousel_slider/carousel_slider.dart';
import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cardColors = [
    AppColors.loginPageBgColor,
    AppColors.loginPageTitleColor,
    AppColors.trackerIconColor,
    AppColors.selectedItemColor,
    AppColors.loginPageBgColor,
    AppColors.lightGreyColor,
    AppColors.lightGreyColor,
    AppColors.lightGreyColor,
  ];
  final textColor = [
    AppColors.loginFieldValueColor,
    AppColors.loginFieldValueColor,
    AppColors.loginFieldValueColor,
    AppColors.loginFieldValueColor,
    AppColors.loginFieldValueColor,
    AppColors.darkGreyColor,
    AppColors.darkGreyColor,
    AppColors.darkGreyColor
  ];
  final cardImages = [
    AppImages.appleImage,
    AppImages.discoverDietImage,
    AppImages.feedbackImage,
    AppImages.healthImage,
    AppImages.learnMoreImage,
    AppImages.nutritionImage,
    AppImages.lifeStyleImage,
    AppImages.arroundMeImage
  ];

  final cardTitles = [
    'My Diet Program',
    'Discover Diet Ideas',
    'Feedback',
    'My Health Records',
    'Learn More',
    'Nutrition Tourism',
    'Diet Ideas Lifestyle Shop',
    'Healthy Foods Around Me',
  ];

  int indicatorIndex = 0;

  final banners = [
    'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.0.sp),
          child: Row(
            children: [
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: banners.length,
                  itemBuilder: (context, index, realIndex) {
                    final banner = banners[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.sp,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                            height: size.height * 0.25,
                            child: Image.network(
                              banner,
                              fit: BoxFit.cover,
                            )),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    scrollPhysics: banners.length == 1
                        ? const NeverScrollableScrollPhysics()
                        : const ScrollPhysics(),
                    autoPlay: banners.length == 1 ? false : true,
                    viewportFraction: 1,
                    onPageChanged: ((index, reason) {
                      setState(() {
                        indicatorIndex = index;
                      });
                    }),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.sp),
                child: AnimatedSmoothIndicator(
                  axisDirection: Axis.vertical,
                  activeIndex: indicatorIndex,
                  count: banners.length,
                  effect: const ScrollingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: AppColors.loginPageBgColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(
                            context, RouteGenerator.myDietProgramScreen);
                        break;
                      case 1:
                        Navigator.pushNamed(
                            context, RouteGenerator.dietIdeasScreen);
                        break;
                      case 2:
                        Navigator.pushNamed(
                            context, RouteGenerator.feedbacksScreen);
                        break;
                      default:
                        Navigator.pushNamed(context, RouteGenerator.homePage);
                    }
                  },
                  child: HomeScreenCard(
                    color: cardColors[index],
                    icon: cardImages[index],
                    textColor: textColor[index],
                    title: cardTitles[index],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
