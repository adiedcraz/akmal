import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/constant.dart';
import '../controllers/auth_controller.dart';

class PhoneView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final size = (Theme.of(context).textTheme.headline3?.fontSize ?? 200) + 150;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('PhoneView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: screenheight * 0.1),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Sila masukkan nombor HP',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 50.0,
          ),
          Form(
            key: controller.formPhoneKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Phone Number',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    onChanged: controller.onPhoneChanged,
                    validator: controller.phoneValidator,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              onPressed: controller.onSubmitOTP,
              child: Text(
                'Log Masuk',
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize:
                        Theme.of(context).textTheme.button!.fontSize! + 8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
