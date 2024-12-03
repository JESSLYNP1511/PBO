import 'package:nailicious_mobile/components/bottom_navigation_bar.dart';
import 'package:nailicious_mobile/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'model.dart';
export 'model.dart';

getUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final email = prefs.getString('email');
  final name = prefs.getString('name');
  final id = prefs.getInt('userId');
  final phoneNumber = prefs.getString('phoneNumber');
  return User(email: email!, id: id!, name: name!, phoneNumber: phoneNumber!);
}

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  User user = User(email: "", id: 1, name: "", phoneNumber: "");

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());
    _setUser();
  }

  @override
  void dispose() {
    _model.dispose();
    print("sampe sini");

    super.dispose();
  }

  _setUser() async {
    final _user = await getUser();
    print(_user);
    setState(() {
      user = _user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFCDD2), Color(0xFFF8BBD0)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 20,
                                  buttonSize: 40,
                                  fillColor: Color(0x33FFFFFF),
                                  icon: Icon(
                                    Icons.menu,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                Text(
                                  'Hi, ${user.name}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 16)),
                            ),
                            Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1502877828070-33b167ad6860?w=500&h=500',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 16)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Nailcious',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.place,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24,
                                    ),
                                    Text(
                                      'Jl. Muara Karang No. 66',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Monday - Friday: 10:00 - 20:00',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Saturday: 10:00 - 18:00',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Sunday: 12:00 - 18:00',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8)),
                                ),
                              ].divide(SizedBox(height: 16)),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Services',
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFFCE4EC),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cleaning_services,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32,
                                    ),
                                    Text(
                                      'Cleaning Only',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8)),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFFCE4EC),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.spa,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32,
                                    ),
                                    Text(
                                      'Manicure',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8)),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFFCE4EC),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.spa,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32,
                                    ),
                                    Text(
                                      'Pedicure',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8)),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFFCE4EC),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.brush,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32,
                                    ),
                                    Text(
                                      'Nail Art Design',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8)),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFFCE4EC),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.content_cut,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32,
                                    ),
                                    Text(
                                      'Nail Extension',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8)),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFFFCE4EC),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.spa,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32,
                                    ),
                                    Text(
                                      'Foot Spa',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Our Specialists',
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Container(
                        height: 220,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  24,
                                  0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Chelsea',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
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
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                              ].divide(SizedBox(width: 4)),
                                            ),
                                            Text(
                                              '213 customers handled',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              '+1 (555) 123-4567',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFCE4EC),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 8, 4, 8),
                                                child: Text(
                                                  'Level 3',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Sarah',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
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
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star_half,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                              ].divide(SizedBox(width: 4)),
                                            ),
                                            Text(
                                              '189 customers handled',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              '+1 (555) 234-5678',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFCE4EC),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 8, 4, 8),
                                                child: Text(
                                                  'Level 3',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Emily',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
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
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color: Color(0xFFFFD700),
                                                  size: 16,
                                                ),
                                              ].divide(SizedBox(width: 4)),
                                            ),
                                            Text(
                                              '167 customers handled',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              '+1 (555) 345-6789',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFCE4EC),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 8, 4, 8),
                                                child: Text(
                                                  'Level 2',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 24)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 4,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: BottomNavigationWidget(selectedIndex: 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
