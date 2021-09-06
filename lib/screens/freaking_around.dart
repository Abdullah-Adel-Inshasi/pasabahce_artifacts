import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pasabahce_artifacts/models/artifact_model.dart';
import 'package:google_fonts/google_fonts.dart';

class AbdullahClass extends StatefulWidget {
  @override
  _AbdullahClassState createState() => _AbdullahClassState();
}

class _AbdullahClassState extends State<AbdullahClass> {
  int cartItems = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverPersistentHeaderDelegat(cartItems: cartItems),
            pinned: true,
            floating: false,
          ),
          SliverFillViewport(
            delegate: SliverFillViewportDelegate((){
              setState(() {
                cartItems++;
              });
            }),
          ),
        ],
      ),
    );
  }
}

class SliverPersistentHeaderDelegat extends SliverPersistentHeaderDelegate {
  final int cartItems;

  SliverPersistentHeaderDelegat({required this.cartItems});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
        child: Container(
          color: Colors.white.withOpacity(0.2),
          child: Center(
            child: CircleAvatar(backgroundColor: Colors.red,child: Text(cartItems.toString()),),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 75;

  @override
  // TODO: implement minExtent
  double get minExtent => 75;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

class SliverFillViewportDelegate extends SliverChildDelegate {
  final VoidCallback onTap;

  SliverFillViewportDelegate(this.onTap);
  @override
  Widget? build(BuildContext context, int index) {
    Random left = Random();
    Random top = Random();
    return index < artifacts.length
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Image.asset(
                artifacts[index].imageUrl,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  artifacts[index].name,
                  // textHeightBehavior: TextHeightBehavior.fromEncoded(1),

                  style: GoogleFonts.katibeh(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Text(
                artifacts[index].description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.openSansCondensed(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    decoration: BoxDecoration(
                        color: Color(0xFFFBE7C6),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'add to cart',
                        style: GoogleFonts.architectsDaughter(
                            fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:75),
              Divider(color: Colors.white,)
            ],
          )
        : index < artifacts.length + 1
            ? Container(
                color: Colors.red,
                child: Stack(
                    children: artifacts.map(
                  (e) {
                    print(top.nextInt(200));
                    return Positioned(
                      left: left.nextBool()
                          ? left.nextInt(200).toDouble()
                          : top.nextInt(100).toDouble(),
                      right: !left.nextBool()
                          ? left.nextInt(200).toDouble()
                          : top.nextInt(200).toDouble(),
                      top: top.nextBool()
                          ? left.nextInt(200).toDouble()
                          : top.nextInt(200).toDouble(),
                      // bottom: !top.nextBool()
                      //     ? left.nextInt(200).toDouble()
                      //     : top.nextInt(200).toDouble(),
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          color: index % 2 == 0 ? Colors.grey : Colors.black,
                          height: 150,
                          width: 150,
                          child: Text(
                            '${top.nextInt(200)}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList()),
              )
            : null;
  }

  @override
  bool shouldRebuild(covariant SliverChildDelegate oldDelegate) {
    return true;
  }
}
