import 'package:store_app/imports.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int imageSelected = 0;
  TextEditingController _titleController;
  TextEditingController _priceController;
  TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = new TextEditingController(text: widget.product.title);
    _priceController = new TextEditingController(
        text: priceToNumber(widget.product.price).toString());
    _descriptionController =
        new TextEditingController(text: widget.product.description);
  }

  Widget build(BuildContext context) {
    print(widget.product.id);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            imageSlide(),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  NormalField(text: "Title", controller: _titleController),
                  NormalField(text: "Price", controller: _priceController),
                  BiggerTextField(
                      text: "Description", controller: _titleController),
                  SizedBox(height: 10),
                  //save button
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.8,
                    child: DefaultButton(
                      text: "SAVE",
                      press: () async {
                        if (_formKey.currentState.validate()) {
                          Product newProduct = widget.product;
                          newProduct.title = _titleController.text;
                          newProduct.description = _descriptionController.text;
                          newProduct.price =
                              numberToPrice(int.parse(_priceController.text));
                          await ApiServices.updateProduct(newProduct.toJson());
                          Get.back();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column imageSlide() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Image.asset(
            widget.product.images[imageSelected],
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
                widget.product.images.length,
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
                      widget.product.images[index],
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
