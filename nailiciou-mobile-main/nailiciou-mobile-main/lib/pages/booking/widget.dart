import 'package:intl/intl.dart';
import 'package:nailicious_mobile/api/booking.dart';
import 'package:nailicious_mobile/api/getNailArtist.dart';
import 'package:nailicious_mobile/api/getService.dart';
import 'package:nailicious_mobile/components/bottom_navigation_bar.dart';
import 'package:nailicious_mobile/model/booking.dart';
import 'package:nailicious_mobile/model/nail_artis.dart';
import 'package:nailicious_mobile/model/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/utils/form_field_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'model.dart';
export 'model.dart';

class BookingPageWidget extends StatefulWidget {
  const BookingPageWidget({super.key});

  @override
  State<BookingPageWidget> createState() => _BookingPageWidgetState();
}

class _BookingPageWidgetState extends State<BookingPageWidget> {
  late BookingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Service> services = [];
  List<NailArtist> nailArtists = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _setOptions();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  _setOptions() async {
    final _services = await callGetServicesApi();
    final _nailArtists = await callGetNailArtistApi();
    setState(() {
      services = _services;
      nailArtists = _nailArtists;
    });
  }

  _handleBooking() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = await prefs.getInt("userId");
    final date = _model.calendarSelectedDay!.end;

    // Parse the hour and minute from the string
    List<String> parts = _model.dropDownValue1!.split(":");
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    final bookingTime =
        DateTime(date.year, date.month, date.day, hour, minute, 0, 0, 0);

    final booking = Booking(
        artistId: _model.dropDownValue3!.id,
        note: _model.textController!.text,
        serviceId: _model.dropDownValue2!.id,
        userId: userId,
        bookingTime: bookingTime);
    final response = await callBookingApi(booking);
    context.go("/history");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFCE4EC), Color(0xFFFFC0CB)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 20,
                              buttonSize: 40,
                              fillColor: Color(0x33FFFFFF),
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Text(
                          'Book Appointment',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ].divide(SizedBox(height: 16)),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(32, 24, 32, 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).primary,
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          weekFormat: false,
                          weekStartsMonday: false,
                          rowHeight: 48,
                          onChange: (DateTimeRange? newSelectedDate) {
                            safeSetState(() =>
                                _model.calendarSelectedDay = newSelectedDate);
                          },
                          titleStyle:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                          dayOfWeekStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          dateStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          selectedDateStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                          inactiveDateStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          'Select booking time',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController1 ??=
                              FormFieldController<String>(null),
                          options: [
                            '9:00',
                            '10:00',
                            '11:00',
                            '13:00',
                            '14:00',
                            '15:00'
                          ],
                          onChanged: (val) =>
                              safeSetState(() => _model.dropDownValue1 = val),
                          width: 200,
                          height: 40,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Select...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        Text(
                          'Select services',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        FlutterFlowDropDown<Service>(
                          controller: _model.dropDownValueController2 ??=
                              FormFieldController<Service>(null),
                          options: services,
                          onChanged: (val) =>
                              safeSetState(() => _model.dropDownValue2 = val),
                          width: 200,
                          height: 40,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Select...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        Text(
                          'Select nail artist',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        FlutterFlowDropDown<NailArtist>(
                          controller: _model.dropDownValueController3 ??=
                              FormFieldController<NailArtist>(null),
                          options: nailArtists,
                          onChanged: (val) =>
                              safeSetState(() => _model.dropDownValue3 = val),
                          width: 200,
                          height: 40,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Select...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        Text(
                          'Note',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Container(
                          width: 200,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Yang bersih ya...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Selected Service',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _model.dropDownValue2 != null
                                            ? _model.dropDownValue2!.name!
                                            : "-",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        _model.dropDownValue2 != null
                                            ? NumberFormat.currency(
                                                    locale: "id",
                                                    symbol: "Rp",
                                                    decimalDigits: 0)
                                                .format(_model
                                                    .dropDownValue2!.price)
                                            : "-",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFFFF69B4),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 16)),
                              ),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            _handleBooking();
                          },
                          text: 'Book Appointment',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width,
                            height: 56,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: Color(0xFFFCE4EC),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3,
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                      ].divide(SizedBox(height: 24)),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 4,
                  child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: BottomNavigationWidget(selectedIndex: 1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
