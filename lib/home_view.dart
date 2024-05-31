import 'package:chamber_choir_outreach/desktop_view.dart';
import 'package:chamber_choir_outreach/mobile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final int _desktopBreakpoint = 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < _desktopBreakpoint) {
        return const MobileView();
      } else {
        return const DesktopView();
      }
    }));
  }
}
