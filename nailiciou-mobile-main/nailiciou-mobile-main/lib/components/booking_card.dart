import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nailicious_mobile/flutter_flow/flutter_flow_theme.dart';
import 'package:nailicious_mobile/model/booking.dart';
import 'package:nailicious_mobile/flutter_flow/flutter_flow_util.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;
  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        // padding: EdgeInsets.only(top: 12, bottom: 12),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1,
            )),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.serviceName!,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontFamily: "Roboto"),
                      ),
                      Text(
                        booking.artistName!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        NumberFormat.currency(
                                locale: "id", symbol: "Rp", decimalDigits: 0)
                            .format(booking.price),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Text(
                        booking.bookingTime!.toIso8601String(),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xFFFFD700),
                    size: 16,
                  ),
                  Text(
                    '4.8',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    '• Pending',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).success,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(width: 8)),
              ),
            ].divide(SizedBox(height: 12)),
          ),
        ),
      ),
    );
  }
}
