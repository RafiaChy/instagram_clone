import 'package:flutter/material.dart';

import 'package:instagram_clone/utils/dimensions.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({
    Key? key,
    required this.webScreenLayout,
    required this.MobileScreenLayout,
  }) : super(key: key);
  final Widget webScreenLayout;
  final Widget MobileScreenLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(  //LayoutBuilder basically helps in creating responsive layouts
      builder: (context, constraints){
        if(constraints.maxWidth > webScreenSize )
        {
          return webScreenLayout;
        }

        return MobileScreenLayout;
      },
    );
  }
}
