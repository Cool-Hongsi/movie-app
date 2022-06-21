// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_search/theme/app_color.dart';
import 'package:movie_search/view/widget/snackbar_widget.dart';

Widget InputWidget(TextEditingController inputController, String hintText,
    String warningMessage, Function onClickInputButton) {
  return TextField(
    controller: inputController,
    textAlignVertical: TextAlignVertical.center,
    cursorColor: fontColorBlack,
    style: TextStyle(
      color: fontColorBlack,
      fontSize: Get.width * .045,
      fontFamily: 'Archivo',
      fontWeight: FontWeight.w400
    ),
    autocorrect: false,
    textCapitalization: TextCapitalization.none,
    enableSuggestions: false,
    decoration: InputDecoration(
      fillColor: backgroundColorGrey,
      filled: true,
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: backgroundColorGrey, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: backgroundColorGrey, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      isDense: true,
      hintStyle: TextStyle(
        fontSize: Get.width * .045,
        color: borderColorDarkGrey,
        fontFamily: 'Archivo',
        fontWeight: FontWeight.w400
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          if (inputController.text.isNotEmpty) {
            onClickInputButton(inputController.text);
          } else {
            SnackbarWidget(warningMessage);
          }
        },
        child: Align(
          widthFactor: 1,
          heightFactor: 1,
          child: Icon(
            Icons.search,
            color: fontColorBlack,
            size: 21,
          )
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25)
    ),
  );
}
