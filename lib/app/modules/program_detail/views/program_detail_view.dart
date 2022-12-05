import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/program_detail_controller.dart';

class ProgramDetailView extends GetView<ProgramDetailController> {
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
              child: ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text('Tarikh'),
                trailing: SizedBox(
                  width: 200,
                  child: Text(
                    controller.program.value?.date ?? '',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
