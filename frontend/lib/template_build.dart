import 'package:flutter/material.dart';
import 'card_object.dart';
import 'CardTemplate_1.dart';
import 'CardTemplate_2.dart';
import 'CardTemplate_3.dart';

Widget k_buildTemplate(BusinessCardModel data, bool editable) {
  switch (data.cardTemplate) {
    case 'template1':
      return CardTemplate_1(data: data, editable: editable);
    case 'template2':
      return CardTemplate_2(data: data, editable: editable);
    case 'template3':
      return CardTemplate_3(data: data, editable: editable);
    default:
    // fallback to a default template if no match
      return CardTemplate_1(data: data, editable: editable);
  }
}