import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;

  // Constructor to receive data
  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => {if (selectedIndex != 0) context.go('/main')},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: selectedIndex == 0
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 24,
                ),
                Text(
                  'Home',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: selectedIndex == 0
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {if (selectedIndex != 1) context.go('/booking')},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today,
                  color: selectedIndex == 1
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 24,
                ),
                Text(
                  'Booking',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: selectedIndex == 1
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {if (selectedIndex != 2) context.go('/history')},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.history,
                  color: selectedIndex == 2
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 24,
                ),
                Text(
                  'History',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: selectedIndex == 2
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {if (selectedIndex != 3) context.go('/profile')},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  color: selectedIndex == 3
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 24,
                ),
                Text(
                  'Profile',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: selectedIndex == 3
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
