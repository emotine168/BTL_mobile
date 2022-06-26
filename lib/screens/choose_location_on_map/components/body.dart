import 'package:here_sdk/core.dart';
import 'package:store_app/screens/choose_location_on_map/components/SearchExample.dart';
import 'package:store_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BuildContext _context;

  SearchExample _searchExample;

  RoutingExample _routingExample;

  Timer t;

  bool showSelection = false;

  var startGeoCoordinates = GeoCoordinates(21.03679, 105.78215);

  var destinationGeoCoordinates;

  Suggestion suggestionSelected;

  List<Suggestion> result = [];

  bool isSearching = false;

  var _selectLocationController = Get.find<SelectLocationController>();

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Stack(
      children: [
        HereMap(onMapCreated: _onMapCreated),
        SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter key word to search',
                    suffixIcon: Container(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        "assets/icons/Location point.svg",
                      ),
                    ),
                  ),
                  onChanged: (text) async {
                    setState(() {
                      isSearching = true;
                    });
                    if (text != '') {
                      if (t != null) t.cancel();
                      t = Timer(Duration(microseconds: 1), () async {
                        await _searchExample.autoSuggest(text);
                        setState(() {
                          if (_searchExample.getSuggestionList() != null)
                            result = _searchExample.getSuggestionList();
                        });
                      });
                    } else {
                      setState(() {
                        result = [];
                        isSearching = false;
                      });
                    }
                  },
                ),
              ),
              isSearching
                  ? new Expanded(
                      child: new ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                            color: Colors.white,
                            child: GestureDetector(
                              onTap: () {
                                _onClick(result[index]);
                              },
                              child: ListTile(
                                title: Text(result[index].title),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      width: 0,
                    ),
            ],
          ),
        ),
        AnimatedPositioned(
          duration: Duration(seconds: 1),
          top: !showSelection
              ? SizeConfig.screenHeight
              : SizeConfig.screenHeight * 0.72,
          child: CustomDialog(suggestionSelected: suggestionSelected),
        ),
      ],
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError error) {
      if (error == null) {
        setState(() {
          _searchExample = SearchExample(_showDialog, hereMapController);
          _routingExample = RoutingExample(_showDialog, hereMapController);
        });
      } else {
        print("Map scene not loaded. MapError: " + error.toString());
      }
    });
  }

  void _onClick(Suggestion suggestion) async {
    _searchExample.moveToGeoCoordinate(suggestion.place.geoCoordinates);
    GeoCoordinates newDestinationGeoCoordinates = GeoCoordinates(
        suggestion.place.geoCoordinates.latitude,
        suggestion.place.geoCoordinates.longitude);
    await _routingExample.addRoute(
        startGeoCoordinates, newDestinationGeoCoordinates);
    setState(() {
      destinationGeoCoordinates = newDestinationGeoCoordinates;
      suggestionSelected = suggestion;
      isSearching = false;
      result = [];
      print(_routingExample.getLengthInMeters());
      showSelection = true;
    });
  }

  Align button(String buttonLabel, Function callbackFunction) {
    return Align(
      alignment: Alignment.topCenter,
      child: RaisedButton(
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        onPressed: () => callbackFunction(),
        child: Text(buttonLabel, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Future<void> _showDialog(String title, String message) async {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
