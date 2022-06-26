import 'package:store_app/imports.dart';
import 'components/body.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";
  @override
  var searchController = Get.put(SearchController());
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    Get.find<SearchController>().search(arguments);
    return Scaffold(
      appBar: HeadingBar(
        searchingText: arguments,
      ),
      body: Body(),
    );
  }
}
