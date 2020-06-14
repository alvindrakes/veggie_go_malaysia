import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/constants/colors.dart';
import 'package:veggie_go_malaysia/ui/views/home/widgets/text_search/text_search_viewmodel.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(fontSize: 18),
                cursorColor: ThemeColors.brightGreen,
                autofocus: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back,
                          color: ThemeColors.brightGreen),
                      onTap: () => model.pop(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[50],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
