import 'package:akmal/app/modules/program/models/program_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/constant.dart';
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
              child: Text(
                controller.program.value?.title ?? '',
                style: TextStyle(fontSize: 20),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: ListTile(
                leading: Icon(Icons.access_time),
                title: Text('Masa'),
                trailing: SizedBox(
                  width: 200,
                  child: Text(
                    controller.program.value?.time ?? '',
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Tempat'),
                trailing: SizedBox(
                  width: 200,
                  child: Text(
                    controller.program.value?.location ?? '',
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Pegawai Terlibat'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: ExpansionTile(
                title: Text('Senarai Pegawai Terlibat'),
                children: controller.program.value!.coordinator!
                    .map((e) => ListTile(
                          title: Text(e),
                        ))
                    .toList(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                onPressed: controller.onSubmitCalendar,
                child: Text(
                  'Add to Calendar',
                  style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize:
                          Theme.of(context).textTheme.button!.fontSize! + 8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
