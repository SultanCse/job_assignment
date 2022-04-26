import 'package:assignment/controllers/home_controller.dart';
import 'package:assignment/dialogs/app_exit_dialog.dart';
import 'package:assignment/models/category.dart';
import 'package:assignment/models/menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  HomeController controller = HomeController();
  HomeController value = HomeController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.initController(context);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = Provider.of<HomeController>(context, listen: false);
    value = Provider.of<HomeController>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    tabController.dispose();
    controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => showAppExitDialog(context: context),
      child: Scaffold(
          appBar: AppBar(
            leading: null,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Text(value.user?.username == null ? '' : '${value.user!.username!.toUpperCase()}\'S PROFILE'),
          ),
          body: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.antiAlias,
            children: [
              Container(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabBar(
                      controller: tabController,
                      isScrollable: false,
                      indicatorWeight: 2,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.white, width: 2)),
                      physics: NeverScrollableScrollPhysics(),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 50),
                      dragStartBehavior: DragStartBehavior.start,
                      labelPadding: EdgeInsets.only(left: 10, right: 10),
                      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.3),
                      tabs: [Tab(text: 'Categories'), Tab(text: 'Menus')],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          categoriesView(context),
                          menusView(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              value.categoryLoader || value.menuLoader
                  ? Container(
                      width: width,
                      height: height,
                      color: Colors.white.withOpacity(0.6),
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(color: Colors.black.withOpacity(0.7)),
                    )
                  : SizedBox.shrink(),
            ],
          )),
    );
  }

  Widget categoriesView(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        itemCount: value.categories.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Category category = value.categories[index];
          return InkWell(
            onTap: () => showAppExitDialog(context: context),
            child: Container(width: width, child: ListTile(title: Text('${category.link ?? ''}'))),
          );
        });
  }

  Widget menusView(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        itemCount: value.menus.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Menu menu = value.menus[index];
          return Container(width: width, child: ListTile(title: Text('${menu.link ?? ''}')));
        });
  }
}
