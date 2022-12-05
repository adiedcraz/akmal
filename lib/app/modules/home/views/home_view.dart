import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/bg2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                'APLIKASI UTAMA',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 12,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: controller.menus.length,
              (BuildContext context, int index) {
                final menu = controller.menus[index];
                final size =
                    (Theme.of(context).textTheme.headline3?.fontSize ?? 80) +
                        30;
                return Column(
                  children: [
                    Card(
                      child: InkWell(
                        onTap: menu.onPressed,
                        child: SizedBox.square(
                          dimension: size,
                          child: Center(
                            child: Icon(
                              menu.icon,
                              size: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        menu.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
