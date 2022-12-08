import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../config/constant.dart';
import '../../home/widgets/Form.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final size = (Theme.of(context).textTheme.headline3?.fontSize ?? 200) + 150;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: screenheight * 0.1),
          SizedBox.square(
            dimension: size,
            child: Image.asset(
              'assets/images/logo_jkdm.png',
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'AKMAL MOBILE',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Log masuk untuk menggunakan aplikasi',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 50.0,
          ),
          FormWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 12.0),
            child: Text(
              'Lupa Kata Laluan',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleMedium,
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
              onPressed: controller.onSubmit,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox.square(
                dimension: 50.0,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    foregroundColor: HexColor('#088770'),
                    side: BorderSide(
                      width: 2.0,
                      color: HexColor('#088770'),
                    ),
                  ),
                  onPressed: controller.onOTP,
                  child: FaIcon(FontAwesomeIcons.phone),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              SizedBox.square(
                dimension: 50.0,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    foregroundColor: HexColor('#EA4335'),
                    side: BorderSide(
                      width: 2.0,
                      color: HexColor('#EA4335'),
                    ),
                  ),
                  onPressed: controller.onGoogle,
                  child: FaIcon(FontAwesomeIcons.google),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              SizedBox.square(
                dimension: 50.0,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    foregroundColor: HexColor('#4267B2'),
                    side: BorderSide(
                      width: 2.0,
                      color: HexColor('#4267B2'),
                    ),
                  ),
                  onPressed: controller.onFacebook,
                  child: FaIcon(FontAwesomeIcons.facebook),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
