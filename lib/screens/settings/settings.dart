import 'package:flutter/material.dart';
import 'package:todo_list/utils/themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Language', style: AppThemes.titleText,),
        DropdownButton(
            items: [
              DropdownMenuItem(value: 'en',child: Text('English', style: AppThemes.regularText),),
              DropdownMenuItem(value: 'ar',child: Text('العربية', style: AppThemes.regularText),)
            ],
            onChanged: (value){},
        ),
        Text('Mode', style: AppThemes.titleText,),
        DropdownButton(
            items: [
              DropdownMenuItem(value: 'light',child: Text('Light', style: AppThemes.regularText),),
              DropdownMenuItem(value: 'dark',child: Text('Dark', style: AppThemes.regularText),)
            ],
            onChanged: (value){})
      ],
    );
  }
}
