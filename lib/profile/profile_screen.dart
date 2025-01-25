import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:task_app/Model/listtile.dart';
import 'package:task_app/Widget/paint.dart';
import 'package:task_app/Widget/profile_earning.dart';
import 'package:task_app/responsive.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
              fontFamily: 'UrbanistRegular',
              fontWeight: FontWeight.w700,
              fontSize: getFont(24),
              color: Color(0xff212121)),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: getHeight(10)),
            height: getHeight(189),
            width: double.maxFinite,
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(120), top: getHeight(60)),
                  child: CustomPaint(
                    painter: CirclePainter(
                      circleHeight: 5,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(40), top: getHeight(40)),
                  child: CustomPaint(
                    painter: CirclePainter(
                      circleHeight: 7,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(30), top: getHeight(110)),
                  child: CustomPaint(
                    painter: CirclePainter(
                      circleHeight: 5,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(105), top: getHeight(150)),
                  child: CustomPaint(
                    painter: CirclePainter(
                      circleHeight: 7,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(340), top: getHeight(10)),
                  child: CustomPaint(
                    painter: CirclePainter(
                      circleHeight: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: getWidth(125)),
                  child: Container(
                    width: getWidth(120),
                    height: getHeight(120),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/Icons/Mask group (5).png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(200), top: getHeight(80)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/Icons/Edit Square.png')),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(120), top: getHeight(130)),
                  child: Text(
                    'David Mathew',
                    style: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w700,
                        fontSize: getFont(24),
                        color: Color(0xff212121)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(120), top: getHeight(160)),
                  child: Text(
                    'David45812@gmail.com',
                    style: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w600,
                        fontSize: getFont(14),
                        color: const Color(0xff212121)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(250), top: getHeight(30)),
                  child: CustomPaint(
                    painter: CirclePainter(
                      circleHeight: 5,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(330), top: getHeight(140)),
                  child: CustomPaint(
                    painter: CirclePainter(
                      circleHeight: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 280, top: 110),
                  child: CustomPaint(
                    painter: CirclePainter(
                      circleHeight: 7,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: getWidth(50), top: getHeight(10)),
                child: ProfileEarningWidget(
                  earning: Text(
                    'Earnings',
                    style: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w600,
                        fontSize: getFont(14),
                        color: Colors.grey),
                  ),
                  child: Text(
                    '\$9500',
                    style: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w700,
                        fontSize: getFont(18),
                        color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: getWidth(25), top: getHeight(10)),
                child: ProfileEarningWidget(
                  earning: Text(
                    'Ratings',
                    style: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w600,
                        fontSize: getFont(14),
                        color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_half,
                        color: Colors.red,
                        size: 18,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                            fontFamily: 'UrbanistRegular',
                            fontWeight: FontWeight.w700,
                            fontSize: getFont(18),
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: getWidth(20), top: getHeight(20), bottom: getHeight(20)),
            child: Text(
              'About Me',
              style: TextStyle(
                  fontFamily: 'UrbanistRegular',
                  fontWeight: FontWeight.w700,
                  fontSize: getFont(18),
                  color: Color(0xff212121)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: getWidth(20), bottom: getHeight(20), right: getWidth(20)),
            child: ReadMoreText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                  fontSize: getFont(14),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'UrbanistRegular',
                  color: Colors.black),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: count.length,
              itemBuilder: (context, index) {
                final item = count[index];
                return ListTile(
                  leading: Image.asset(
                    item.leading,
                    width: 24,
                    height: 24,
                  ),
                  title: Text(item.title),
                  trailing: Image.asset(
                    item.trailing,
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey[300],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
