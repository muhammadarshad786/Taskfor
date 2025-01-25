import 'package:flutter/material.dart';
import 'package:task_app/Model/small_icons.dart';
import 'package:task_app/responsive.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(340),
          child: Container(
            height: getHeight(350),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(20), top: getHeight(40)),
                  child: Text(
                    'Hello !',
                    style: TextStyle(
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: getFont(30)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(20), right: getWidth(20)),
                  child: Row(
                    children: [
                      Text(
                        'David Mathew',
                        style: TextStyle(
                            fontFamily: 'UrbanistRegular',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: getFont(24)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: getWidth(170)),
                        child: Image.asset('assets/Icons/Mask group (3).png'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getWidth(20),
                      right: getWidth(20),
                      top: getHeight(20)),
                  child: Container(
                    height: getHeight(175),
                    width: getWidth(354),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getHeight(175),
                          width: getWidth(170),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: getHeight(15), left: getWidth(15)),
                                child: Text(
                                  'My Earnings',
                                  style: TextStyle(
                                      fontFamily: 'UrbanistRegular',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: getFont(20)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: getWidth(15)),
                                child: Text('\$9,545',
                                    style: TextStyle(
                                        fontFamily: 'UrbanistRegular',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffEC3F2E),
                                        fontSize: getFont(40))),
                              ),
                              Stack(
                                  alignment: AlignmentDirectional.topStart,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: getWidth(4.469 - 0.00214)),
                                      child: Image.asset(
                                        'assets/Icons/clipath.png',
                                        height: getHeight(90),
                                        width: double.maxFinite,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: getHeight(20),
                                          left: getWidth(20)),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(50, 20),
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.grey,
                                          foregroundColor: Colors.white,
                                          textStyle: TextStyle(
                                            fontSize: getFont(8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: const Text('Detailed'),
                                      ),
                                    )
                                  ])
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: getHeight(24)),
                          child: SizedBox(
                            height: getHeight(150),
                            width: getWidth(155),
                            child: Image.asset(
                              'assets/Icons/card.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: getHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: list
                  .map(
                    (image) => CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(image.imagePath),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getHeight(20),
                left: getWidth(40),
                right: getWidth(40),
                bottom: getHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: list1
                  .map(
                    (image) => CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(image.imagePath),
                    ),
                  )
                  .toList(),
            ),
          ),
          Center(
            child: Text(
              'Invite your friends and \n    get big discounts',
              style: TextStyle(
                  fontFamily: 'UrbanistRegular',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: getFont(32)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: getWidth(80),
                right: getWidth(80),
                top: getHeight(20),
                bottom: getHeight(20)),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEC3F2E),
                minimumSize: const Size(45, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Icons/copy.png',
                    height: getHeight(16),
                    width: getWidth(16),
                  ),
                  const SizedBox(width: 25),
                  Text(
                    'Copy Referral link',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'UrbanistRegular',
                      fontWeight: FontWeight.w700,
                      fontSize: getFont(16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              'Send To',
              style: TextStyle(
                color: Color(0xFFEC3F2E),
                fontFamily: 'UrbanistRegular',
                fontWeight: FontWeight.w700,
                fontSize: getFont(15),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: getWidth(80), right: getWidth(80), top: getHeight(20)),
            child: Center(
              child: MaterialButton(
                height: 45,
                minWidth: 241,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: const Color(0xFFEC3F2E),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Icons/Send.png',
                      height: getHeight(20),
                      width: getWidth(20),
                    ),
                    const SizedBox(width: 25),
                    Text(
                      'Send Referral Link ',
                      style: TextStyle(
                        color: Color(0xFFEC3F2E),
                        fontFamily: 'UrbanistRegular',
                        fontWeight: FontWeight.w700,
                        fontSize: getFont(16),
                      ),
                    ),
                  ],
                ),
                //color: Colors.white,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
// class CurveCustomPainter extends CustomPainter{

//   @override
//   void paint(Canvas canvas, Size size) {

//   // Layer 1

//   Paint paint_fill_0 = Paint()
//       ..color = const Color.fromARGB(255, 255, 255, 255)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width*0.2
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     Path path_0 = Path();
//     path_0.moveTo(size.width*0.1675000,size.height*0.3671429);
//     path_0.lineTo(size.width*0.2591667,size.height*0.3585714);
//     path_0.lineTo(size.width*0.3350000,size.height*0.3728571);
//     path_0.lineTo(size.width*0.3875000,size.height*0.4085714);
//     path_0.lineTo(size.width*0.4233333,size.height*0.4628571);
//     path_0.lineTo(size.width*0.4525000,size.height*0.5200000);
//     path_0.lineTo(size.width*0.5058333,size.height*0.5257143);
//     path_0.lineTo(size.width*0.5733333,size.height*0.5271429);
//     path_0.lineTo(size.width*0.5733333,size.height*0.5257143);
//     path_0.lineTo(size.width*0.6216667,size.height*0.5642857);
//     path_0.lineTo(size.width*0.1666667,size.height*0.5585714);

//     canvas.drawPath(path_0, paint_fill_0);

//   // Layer 1

//   Paint paint_stroke_0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width*0.02
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     canvas.drawPath(path_0, paint_stroke_0);

//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }

// }
