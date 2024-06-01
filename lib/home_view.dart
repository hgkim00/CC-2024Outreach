import 'dart:developer';

import 'package:chamber_choir_outreach/desktop_view.dart';
import 'package:chamber_choir_outreach/mobile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final int _firstBreakpoint = 800;
  final int _secondBreakpoint = 1000;
  final int _thirdBreakpoint = 1200;
  final int _fourthBreakpoint = 1400;

  @override
  Widget build(BuildContext context) {
    // return const MobileView();
    return LayoutBuilder(builder: ((context, constraints) {
      //* width 800 이하
      if (constraints.maxWidth < _firstBreakpoint) {
        log("800 이하");
        return MobileView(breakPoint: 0);
      }
      //* width 800 ~ 1200
      else if (constraints.maxWidth < _secondBreakpoint) {
        log("800 ~ 1000");
        return MobileView(breakPoint: 100);
      } else if (constraints.maxWidth < _thirdBreakpoint) {
        log("1000 ~ 1200");
        return MobileView(breakPoint: 200);
      }
      //* width 1200 ~ 1400
      else if (constraints.maxWidth < _fourthBreakpoint) {
        log("1200 ~ 1400");
        return MobileView(breakPoint: 300);
      }
      //* width 1400 이상
      else {
        log("1400 이상");
        return MobileView(breakPoint: 400);
      }
    }));
  }
}
