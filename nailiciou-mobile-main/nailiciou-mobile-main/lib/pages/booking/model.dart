import 'package:nailicious_mobile/model/nail_artis.dart';
import 'package:nailicious_mobile/model/service.dart';

import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/utils/form_field_controller.dart';
import 'widget.dart' show BookingPageWidget;
import 'package:flutter/material.dart';

class BookingPageModel extends FlutterFlowModel<BookingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  Service? dropDownValue2;
  FormFieldController<Service>? dropDownValueController2;
  // State field(s) for DropDown widget.
  NailArtist? dropDownValue3;
  FormFieldController<NailArtist>? dropDownValueController3;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    textController?.dispose();
    textFieldFocusNode?.dispose();
  }
}
