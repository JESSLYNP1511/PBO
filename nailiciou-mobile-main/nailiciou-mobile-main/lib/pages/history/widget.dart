import 'package:nailicious_mobile/api/getBooking.dart';
import 'package:nailicious_mobile/components/booking_card.dart';
import 'package:nailicious_mobile/components/bottom_navigation_bar.dart';
import 'package:nailicious_mobile/model/booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'model.dart';
export 'model.dart';

class BookingHistoryWidget extends StatefulWidget {
  const BookingHistoryWidget({super.key});

  @override
  State<BookingHistoryWidget> createState() => _BookingHistoryWidgetState();
}

class _BookingHistoryWidgetState extends State<BookingHistoryWidget> {
  late BookingHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Booking> bookingList = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingHistoryModel());

    getBooking();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  getBooking() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt("userId");
    final _bookings = await callGetBookingsApi(userId!);
    print(_bookings);

    setState(() {
      bookingList = _bookings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFCE4EC),
          automaticallyImplyLeading: false,
          title: Text(
            'History',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return BookingCard(booking: bookingList[index]);
                    },
                    itemCount: bookingList.length),
              ),
              BottomNavigationWidget(selectedIndex: 2)
            ],
          ),
        ),
      ),
    );
  }
}
