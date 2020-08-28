import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background(this.height, this.width);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(height: height, color: Theme.of(context).primaryColor),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
            child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _imageLogo('firebase_logo'),
              ],
            ),
            _titleText('+'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[_imageLogo('flutter_logo')],
            ),
          ],
        )),
      ),
    ]);
  }

  Text _titleText(String txt) {
    return Text(
      txt,
      style: TextStyle(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    );
  }

  Image _imageLogo(String imgAssetName) {
    return Image(
      image: Image.asset('assets/images/$imgAssetName.png').image,
      width: width * 0.6,
      height: width / 5,
      fit: BoxFit.contain,
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - 120);

    final firstEndPoint = Offset(size.width * .5, size.height - 50.0);
    final firstControlpoint = Offset(size.width * 0.3, size.height - 90.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint = Offset(size.width, size.height);
    final secondControlPoint = Offset(size.width * .75, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
