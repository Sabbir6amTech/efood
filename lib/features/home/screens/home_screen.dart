import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/widgets/custom_dot_indicator.dart';
import 'package:flutter_restaurant/common/widgets/custom_food_image.dart';
import 'package:flutter_restaurant/common/widgets/sliver_app_bar.dart';
import 'package:flutter_restaurant/features/home/provider/imagewithtitle_provider.dart';
import 'package:flutter_restaurant/features/home/widgets/today_spacial_widget.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';
import '../../../common/models/image_data.dart';
import '../../../utill/images.dart';

class HomeScreen extends StatefulWidget {
  final bool fromAppBar;
  const HomeScreen(this.fromAppBar, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<String> images = [Images.poster, Images.poster1, Images.poster2];
  List<String> images2 = [Images.poster1, Images.poster2, Images.poster];

  final List<ImageData> foodItems = [
    ImageData(imagePath: Images.cake, title: 'Cake'),
    ImageData(imagePath: Images.chicken, title: 'fish'),
    ImageData(imagePath: Images.lunch1, title: 'coffee'),
    ImageData(imagePath: Images.chinese, title: 'setmenu'),
    // Add more items as needed
  ];

  final TextEditingController _filter = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final SwiperController swiperController = SwiperController();

  bool _isSearchBarVisible = false;
  final page_controller = PageController();

  void addFavoriteItem() {}

  @override
  void initState() {
    super.initState();
    final imageWithTitleProvider = Provider.of<ImageWithTitleProvider>(context,listen: false);
    imageWithTitleProvider.getBannerImage();

    _scrollController.addListener(_onScroll);
    page_controller.addListener(() {
      setState(() {
        _currentIndex = page_controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    setState(() {
      _isSearchBarVisible = offset > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
   //---------------------------
    // --------------------------


    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: MySliverAppBar(
                  expandedHeight: 120,
                  filter: _filter,
                  isSearchBarVisible: _isSearchBarVisible),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: TodaySpacialWidget(images: images, images2: images2)),
            // ------------------- carousel slider image end------------------------

            //------------------ dish discovers start-------------------------
            SliverToBoxAdapter(
              child: Text(
                getTranslated('dish_discoveries', context)!,
                style: rubikMedium,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FBFF),
                ),
                child: Consumer<ImageWithTitleProvider>(
                  builder: (context, imageWithTitleProvider, _) {
                    print('image length ${imageWithTitleProvider.imageWithTitleList?.length}');

                    return imageWithTitleProvider.imageWithTitleList == null ? const CircularProgressIndicator() :  Swiper(
                      outer: true,
                      itemBuilder: (context, index) {
                        int startIndex = index * 8;
                        int endIndex = startIndex + 8;
                        endIndex = endIndex > imageWithTitleProvider.imageWithTitleList!.length
                            ? imageWithTitleProvider.imageWithTitleList!.length
                            : endIndex;
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 6.0,
                            crossAxisSpacing: 6.0,
                          ),
                          itemCount: endIndex - startIndex,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, gridIndex) {
                            String imagePath = imageWithTitleProvider.imageWithTitleList![startIndex + gridIndex].image;
                            String title = imageWithTitleProvider.imageWithTitleList![startIndex + gridIndex].title;

                            return Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    elevation: 5.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(imagePath),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    title,
                                    style: rubikRegular,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      itemCount: (imageWithTitleProvider.imageWithTitleList!.length / 8).ceil(),
                      controller: swiperController,
                    );
                  }
                ),
              ),
            ),

            //------------------ dish discovers end-------------------------

            //------------------------ local eats start----------------

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getTranslated('lets_eat', context)!,
                      style: rubikBold,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(getTranslated('discover_all', context)!))
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    return CustomFoodImage(
                      myFoodIMageList: foodItems[index],
                      functionality: addFavoriteItem,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
