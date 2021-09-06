import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/models/artifact_model.dart';
import 'package:pasabahce_artifacts/screens/screens.dart';

import 'home_screen.dart';

class ProductPage extends StatefulWidget {
  final Artifact artifact;

  const ProductPage({Key? key, required this.artifact}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {

  int selectedImageIndex = 0;
  late TabController tabController;
  int selectedTabBar = 0;

  late List<Widget> tabBarChildren;

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 5; i++) {
      indicators.add(
        _indicator(
            index: i, isSelected: i == selectedImageIndex ? true : false),
      );
    }
    return indicators;
  }

  _indicator({required bool isSelected, required int index}) {
    int difference = (index - selectedImageIndex).abs();
    late double size;
    if (difference == 0)
      size = 12;
    else if (difference == 1)
      size = 8;
    else if (difference == 2)
      size = 4;
    else
      size = 2;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFFA87E6F)
              : Color(0xFFA87E6F).withOpacity(0.5),
          shape: BoxShape.circle),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabBarChildren = [
      Container(
        margin: EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Text(
          widget.artifact.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
      Container(
        height: 60 * (specifications.length + 1) + 5,
        child: ListView.separated(
          itemCount: specifications.length,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Specification specification = specifications[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    specification.specificationName,
                    style: TextStyle(color: Color(0xFF676870), fontSize: 16),
                  ),
                  Text(
                    specification.specificationValue,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: Colors.black.withOpacity(0.1),
              endIndent: 30,
              indent: 30,
            );
          },
        ),
      ),
      Container(
        height: 225 * 2,
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            Review review = reviews[index];
            return Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xFFF7F7F7),
                            child: Image.asset(review.imgUrl),
                          ),
                          SizedBox(width: 15),
                          Text(review.name, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Text(review.date, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(review.review,
                      style: TextStyle(color: Color(0xFF676870))),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          print('${review.name} review is helpful');
                        },
                        child: Container(
                          width: 110,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Text(
                              'Helpful?',
                              style: TextStyle(color: Color(0xFF272833)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print('reported ${review.name}\'s review');
                        },
                        child: Text(
                          'Report',
                          style: TextStyle(color: Color(0xFFCC9D76)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: Colors.black.withOpacity(0.1),
              endIndent: 30,
              indent: 30,
            );
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              ProductAppBar(),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(),
                            Container(
                              width: 300,
                              height: 300,
                              child: PageView.builder(
                                onPageChanged: (int index) {
                                  setState(() {
                                    selectedImageIndex = index;
                                  });
                                },
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Image.asset(widget.artifact.imageUrl);
                                },
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // height: 500,
                        width: double.infinity,
                        // transform: Matrix4.translationValues(0, -20, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              width: 300,
                              child: Text(
                                widget.artifact.name,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                            Text(
                              '${widget.artifact.rating}/5   ${widget.artifact.reviews} ratings',
                              style: TextStyle(
                                  color: Color(0xFF272833), fontSize: 13),
                            ),
                            SizedBox(height: 15),
                            Container(
                              width: 300,
                              child: Text(
                                widget.artifact.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xFF676870)),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              '\$${widget.artifact.price}',
                              style: TextStyle(
                                fontSize: 28,
                                color: Color(0xFFCC9D76),
                              ),
                            ),
                            TabBar(
                              controller: tabController,
                              indicatorColor: Color(0xFFCC9D76),
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              unselectedLabelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                              labelColor: Colors.black,
                              onTap: (int tabIndex) {
                                setState(() {
                                  selectedTabBar = tabIndex;
                                });
                              },
                              tabs: [
                                Tab(
                                  text: 'Description',
                                ),
                                Tab(
                                  text: 'Specifications',
                                ),
                                Tab(
                                  text: 'Reviews',
                                )
                              ],
                            ),
                            tabBarChildren[selectedTabBar],
                            Container(
                                margin: EdgeInsets.only(top: 15, bottom: 25),
                                child: Text('Similar products',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black))),
                            ItemsCarousel(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              margin: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                    backgroundColor: Color(0xFFF7F7F7),
                                  ),
                                  SignButton(
                                    label: 'Add to cart',
                                    onTap: () {},
                                  ),
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Colors.black,
                                    ),
                                    backgroundColor: Color(0xFFF7F7F7),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      floating: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        iconSize: 30,
      ),
      title: Text(
        'Product details',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_outlined),
              color: Colors.black,
              iconSize: 30,
            ),
            Positioned(
              bottom: 15,
              right: 10,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFCC9D76),
                ),
                child: Center(
                  child: Text(
                    '6',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
