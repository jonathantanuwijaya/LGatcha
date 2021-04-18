part of 'shared.dart';

const Color backgroundColorAuth = Colors.white;
const Color mainColor = Color(0xFF503E9D);
const Color accentColor1 = Color(0xFF2C1F63);
const Color accentColor2 = Color(0xFFFBD460);
const Color accentColor3 = Color(0xFFADADAD);
Color snackBarColor = "D9435E".toColor();
Color mainColor2 = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);



TextStyle disclaimerText = GoogleFonts.raleway().copyWith(color: Colors.red,fontWeight: FontWeight.bold);
TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle purpleTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);
TextStyle bottomNavBarTextStyle = GoogleFonts.raleway(
    fontSize: 13, fontWeight: FontWeight.w600);

TextStyle whiteNumberFont = GoogleFonts.openSans()
    .copyWith(color: Colors.white);
TextStyle yellowNumberFont = GoogleFonts.openSans()
    .copyWith(color: accentColor2);
