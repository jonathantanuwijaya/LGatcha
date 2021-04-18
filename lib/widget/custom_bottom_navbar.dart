part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int bottomNavBarIndex;
  final Function onTap;

  CustomBottomNavBar({this.bottomNavBarIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavBarClipper(),
        child: Container(
          height: 70,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: mainColor,
            unselectedItemColor: Colors.grey,
            currentIndex: bottomNavBarIndex,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                  label: 'Tempat Makan',

                  icon: Icon(MdiIcons.food)),
              BottomNavigationBarItem(
                  label:'Gatcha',
                  icon: Icon(MdiIcons.information))
            ],
            selectedLabelStyle: bottomNavBarTextStyle,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        ),
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
