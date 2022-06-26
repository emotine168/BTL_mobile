import 'package:store_app/imports.dart';

class ImageSlide extends StatefulWidget {
  const ImageSlide({
    Key key,
    this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  _ImageSlideState createState() => _ImageSlideState();
}

class _ImageSlideState extends State<ImageSlide> {
  var imageSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Image.asset(
            widget.images[imageSelected],
            height: SizeConfig.screenHeight * 0.25,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                widget.images.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      imageSelected = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: imageSelected == index
                            ? kPrimaryColor
                            : kSecondaryColor,
                      ),
                    ),
                    child: Image.asset(
                      widget.images[index],
                      height: getProportionateScreenHeight(80),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
