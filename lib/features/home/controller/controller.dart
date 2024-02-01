import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_home/features/datails/model/model.dart';
import 'package:smart_home/features/home/model/model.dart';

class Controller {
  // ignore: non_constant_identifier_names
  List<Model> model_list = [
    Model(
        icon: Icons.air_rounded,
        value: "°C",
        desc: '',
        title1: "Working space",
        title2: "Air Conditioner",
        flag: false,
        model: CustompageModel(
            detail_name: "Air Condititioner",
            detail_value: "°C",
            detail_value1: "Room",
            detail_value3: "Temperature",
            detail_mode: "Mode",
            detail_modename: "POWER FULL",
            model1:
                CustomModel(icon: Icons.coronavirus, value: "COLD", flag: true),
            model2: CustomModel(icon: Icons.air, value: "FAN", flag: false),
            model3: CustomModel(
                icon: Icons.water_drop_outlined, value: "DRY", flag: false),
            value: 24)),
    Model(
        icon: CupertinoIcons.speaker_2,
        value: "%",
        desc: 'Volume',
        title2: "Google Next",
        title1: "Working space",
        flag: false,
        model: CustompageModel(
            detail_name: "Google Next",
            detail_value: "%",
            detail_value1: "",
            detail_value3: "Volume",
            detail_mode: "Mode",
            detail_modename: "Balance",
            model1:
                CustomModel(icon: Icons.speaker, value: "Volume", flag: false),
            model2: CustomModel(
                icon: Icons.surround_sound, value: "SURROUND", flag: false),
            model3: CustomModel(
                icon: Icons.auto_awesome, value: "Auto", flag: true),
            value: 60)),
    Model(
        icon: CupertinoIcons.light_max,
        value: "%",
        desc: 'Percentage',
        title1: "Working space",
        title2: "Desk Lamp",
        flag: false,
        model: CustompageModel(
            detail_name: "Desk Lamp",
            detail_value: "%",
            detail_value1: "",
            detail_value3: "Brightness",
            detail_mode: "Mode",
            detail_modename: "Manual",
            model1: CustomModel(
                icon: Icons.offline_bolt, value: "Off", flag: false),
            model2: CustomModel(icon: Icons.wifi, value: "Wifi", flag: true),
            model3: CustomModel(
                icon: Icons.auto_awesome, value: "Auto", flag: false),
            value: 70)),
    Model(
        icon: Iconsax.airdrop,
        value: "",
        desc: 'Users',
        title1: "Living Room",
        title2: "Mi Router 5 ",
        flag: false,
        model: CustompageModel(
            detail_name: "Mi Router 5",
            detail_value: "",
            detail_value1: "User",
            detail_value3: "Connected",
            detail_mode: "Maximun",
            detail_modename: "100",
            model1: CustomModel(icon: Iconsax.wifi5, value: "Wifi", flag: true),
            model2: CustomModel(icon: Icons.swipe, value: "Off", flag: false),
            model3: CustomModel(
                icon: Icons.connect_without_contact,
                value: "Auto",
                flag: false),
            value: 5)),
  ];
}
