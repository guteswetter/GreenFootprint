import '/components/date_picker_widget.dart';
import '/components/menu_zusammenstellung_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'mahlzeit_zutaten_auswaehlen_backup_widget.dart'
    show MahlzeitZutatenAuswaehlenBackupWidget;
import 'package:flutter/material.dart';

class MahlzeitZutatenAuswaehlenBackupModel
    extends FlutterFlowModel<MahlzeitZutatenAuswaehlenBackupWidget> {
  ///  Local state fields for this page.

  List<int> zutatName = [];
  void addToZutatName(int item) => zutatName.add(item);
  void removeFromZutatName(int item) => zutatName.remove(item);
  void removeAtIndexFromZutatName(int index) => zutatName.removeAt(index);
  void insertAtIndexInZutatName(int index, int item) =>
      zutatName.insert(index, item);
  void updateZutatNameAtIndex(int index, Function(int) updateFn) =>
      zutatName[index] = updateFn(zutatName[index]);

  ///  State fields for stateful widgets in this page.

  // Model for DatePicker component.
  late DatePickerModel datePickerModel;
  // State field(s) for DropDown widget.
  List<int>? dropDownValue;
  FormFieldController<List<int>>? dropDownValueController;
  // Models for MenuZusammenstellung dynamic component.
  late FlutterFlowDynamicModels<MenuZusammenstellungModel>
      menuZusammenstellungModels;

  @override
  void initState(BuildContext context) {
    datePickerModel = createModel(context, () => DatePickerModel());
    menuZusammenstellungModels =
        FlutterFlowDynamicModels(() => MenuZusammenstellungModel());
  }

  @override
  void dispose() {
    datePickerModel.dispose();
    menuZusammenstellungModels.dispose();
  }
}
