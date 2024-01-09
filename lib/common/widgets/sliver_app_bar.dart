import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final TextEditingController filter;
  final bool isSearchBarVisible;

  MySliverAppBar({
    required this.expandedHeight,
    required this.filter,
    required this.isSearchBarVisible,
  });

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    var searchBarOffset = expandedHeight - shrinkOffset - 40;
    var topPosition = searchBarOffset < 0 ? 0 : searchBarOffset;
    print('value of search $searchBarOffset');

    // Calculate the visibility of the background color based on scroll position
    bool isBackgroundVisible = shrinkOffset < expandedHeight - kToolbarHeight;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        if (isBackgroundVisible)
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: (searchBarOffset / 100),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red, // Your desired background color
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Location',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      'Dhanmondi',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Positioned(
          top: isSearchBarVisible ? 15 : topPosition.toDouble() + 15,
          left: 15,
          right: 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 55,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                    color: Colors.redAccent, // Border color for the text field
                    width: 1, // Border width
                  ),
                ),
                child: Center(
                  child: CupertinoTextField(
                    controller: filter,
                    keyboardType: TextInputType.text,
                    placeholder: 'Are you Hungry?',
                    placeholderStyle: const TextStyle(
                      color: Color(0xffC4C6CC),
                      fontSize: 14.0,
                      fontFamily: 'Rubik',
                    ),
                    prefix: const Padding(
                      padding: EdgeInsets.fromLTRB(6.0, 5.0, 0.0, 5.0),
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}