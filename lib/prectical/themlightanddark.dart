import 'package:flutter/material.dart';
import 'package:jsonapi/prectical/provider/newtheme.dart';
import 'package:jsonapi/prectical/provider/newtheme.dart';
import 'package:jsonapi/prectical/provider/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

class themLightAndDark extends StatefulWidget {
  const themLightAndDark({Key? key}) : super(key: key);

  @override
  State<themLightAndDark> createState() => _themLightAndDarkState();
}

class _themLightAndDarkState extends State<themLightAndDark> {
  DarkThemeProvider th = DarkThemeProvider();

  bool select = false;
  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<themesetting>(context,listen: false);
    final th = Provider.of<DarkThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ToggleSwitch(
              minWidth: 190.0,
              minHeight: 50,
              initialLabelIndex: 1,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ['Light', 'Dark'],
              fontSize: 25,
              //  icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
              activeBgColors: [
                [Colors.orange],
                [Colors.pink]
              ],
              onToggle: (index) {
                print('switched to: $index');

                switch (index) {
                  case 0:
                    th.setdarkTheme = true;
                    break;
                  case 1:
                    th.setdarkTheme = false;
                    break;
                }
              },
            ),
          ),
          Switch(
              activeColor: Colors.orange,
              inactiveThumbColor: Colors.green,
              inactiveTrackColor: Colors.pink,
              value: select,
              onChanged: (val) {
                select = val;
                th.setdarkTheme = select;
              }),
          Card(
            child: Container(
              height: 200,
              width: 200,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setting.toggelethem();
              },
              child: Text('theme'))
        ],
      ),
    );
  }

}
