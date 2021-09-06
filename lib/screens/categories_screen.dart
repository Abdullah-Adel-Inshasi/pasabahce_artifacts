import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/models/artifact_model.dart';
import 'package:pasabahce_artifacts/screens/home_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          delegate: CustomSliverAppBar(),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: <Widget>[
                Container(
                  width: 240,
                  child: Text(
                    'Ottoman Collection Classic Collections',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Search through more than 1000+ watches',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF676870),
                  ),
                ),
                SizedBox(height: 30),
                CarouselHeader(
                  label: 'Limited Edition',
                  onTap: () {
                    print('see all products');
                  },
                ),
                SizedBox(height: 15),
                ArtifactsWithDiscountCarousel(artifacts: ottomanCollection),
                SizedBox(height: 40),
                CarouselHeader(label: 'Anatolian Civilizations Catalog'),
                SizedBox(height: 15),
                ArtifactsWithDiscountCarousel(artifacts: anatolianCatalog),
                SizedBox(height: 40),
                CarouselHeader(label: 'Zevk-i Selim Catalog'),
                SizedBox(height: 15),
                ArtifactsWithDiscountCarousel(artifacts: zevkCatalog),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ArtifactsWithDiscountCarousel extends StatelessWidget {
  final List<Artifact> artifacts;

  const ArtifactsWithDiscountCarousel({Key? key, required this.artifacts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: artifacts.length,
        itemBuilder: (context, index) {
          Artifact artifact = artifacts[index];
          return _buildArtifact(artifact);
        },
      ),
    );
  }
}

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            Row(
              children: [
                SizedBox(width: 25),
                Text(
                  'categories'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.tune, size: 30, color: Colors.white),
                SizedBox(width: 20),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

_buildArtifact(Artifact artifact) {
  return Column(
    children: <Widget>[
      Container(
        height: 150,
        width: 170,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Image.asset(
              artifact.imageUrl,
              alignment: Alignment.centerLeft,
              height: 150,
              width: 150,
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  artifact.discount != null
                      ? Container(
                          height: 24,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFCC9D76),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '-${artifact.discount}%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        )
                      : Text(''),
                  GestureDetector(
                    onTap: () {
                      print('add to bookmark');
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xFFF7EFE9),
                      child: Icon(
                        Icons.bookmark,
                        color: Color(0xFFCC9D76),
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 10),
      Container(
        width: 120,
        child: Text(
          artifact.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16),
        ),
      ),
      SizedBox(height: 5),
      Text(
        '\$${artifact.price.toInt()}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
