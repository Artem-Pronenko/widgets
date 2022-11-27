import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:flutter_widgets/user_card.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  late final PageController _pageController;
  late int page;

  @override
  void initState() {
    super.initState();
    page = 0;
    _pageController = PageController(initialPage: page);
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _prevPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 700),
      curve: Curves.ease,
    );
  }

  _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 700),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Container(width: 50, height: 50, color: Colors.red,),

            ),
            backgroundColor: Color(0xFFF2F7FA),
            pinned: true,
            elevation: 0,
            // collapsedHeight: 150,
            expandedHeight: 300,
            // floating: true,
            // snap: true,
            // title: Text(
            //   'What they write about us',
            //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            // ),
            // leading: Text('asdas', style: TextStyle(fontSize: 44),),
            // actions: [
            //   ElevatedButton(onPressed: () {}, child: Text('das')),
            //   ElevatedButton(onPressed: () {}, child: Text('das')),
            //   ElevatedButton(onPressed: () {}, child: Text('das')),
            // ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SliderButton(
                    onPressed: _prevPage,
                    icon: Icons.arrow_back,
                  ),
                  ...List.generate(
                    userList.length,
                    (index) => SliderDot(isActive: index == page),
                  ),
                  SliderButton(
                    onPressed: _nextPage,
                    icon: Icons.arrow_forward,
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: PageView(
        controller: _pageController,
        pageSnapping: false,
        onPageChanged: (int currentPage) {
          setState(() {
            page = currentPage;
          });
        },
        children: userList
            .map((user) =>
                SingleChildScrollView(child: UserCard(user: user)))
            .toList(),
      ),
    );
  }
}

class SliderButton extends StatelessWidget {
  const SliderButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 20,
        ),
        color: Colors.blue,
      ),
    );
  }
}

class SliderDot extends StatelessWidget {
  const SliderDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Align(
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
