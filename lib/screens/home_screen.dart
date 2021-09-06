import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/models/artifact_model.dart';
import 'package:pasabahce_artifacts/screens/product_page.dart';

import 'home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            'store'.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.black,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Ottoman Collection',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Find the perfect watch for your wrist',
                    style: TextStyle(color: Color(0xFF676870), fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  CarouselHeader(label: 'Categories'),
                  SizedBox(height: 10),
                  ItemsCarousel(),
                  CarouselHeader(label: 'Top deals'),
                  DealsCarousel(),
                  SizedBox(height: 20),
                  CarouselHeader(label: 'Featured products'),
                  ItemsCarousel(),
                  SizedBox(height: 30),
                  ItemsCarousel(),
                  SizedBox(height: 10),
                  CarouselHeader(label: 'Search by brand'),
                  SizedBox(height: 20),
                  ItemsCarousel(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DealsCarousel extends StatefulWidget {
  @override
  _DealsCarouselState createState() => _DealsCarouselState();
}

class _DealsCarouselState extends State<DealsCarousel> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          Artifact artifact = artifacts[index + 3];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(artifact: artifact)));
            },
            child: Container(
              width: 320,
              height: 160,
              margin: EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 15),
              padding:
                  EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 120,
                        child: Text(artifact.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                      ),
                      Text(
                        '\$${artifact.price.toInt()}',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 1.8,
                    alignment: Alignment(0, 0.2),
                    child: Image.asset(
                      artifact.imageUrl,
                      height: 110,
                      width: 110,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF272833),
                    Color(0xFFB86518),
                  ],
                  begin: Alignment(0, 1),
                  end: Alignment(-1, -1.25),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CarouselHeader extends StatelessWidget {
  final String label;
  final VoidCallback ? onTap;

  const CarouselHeader({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap:onTap,
            child: Text(
              'See all »',
              style: TextStyle(fontSize: 14, color: Color(0xFFCC9D76)),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemsCarousel extends StatelessWidget {
  const ItemsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 220,
        width: double.infinity,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Artifact artifact = artifacts[index + 1];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(artifact: artifact)));
              },
              child: Column(
                children: <Widget>[
                  Image.asset(artifact.imageUrl, width: 150, height: 150),
                  SizedBox(height: 10),
                  Text(
                    artifact.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${artifact.price.toInt()}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ]);
  }
}
