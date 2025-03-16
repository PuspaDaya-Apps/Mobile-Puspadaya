import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../model/alat_ukur_response_model.dart';

class DropdownAlatUkurWidget extends StatelessWidget {
  final List<Data> items;
  final List<String> itemsId;

  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSaved;

  final String hint;
  final Data? value; // Ubah menjadi nullable
  // final FormFieldValidator<Data>? validator;

  DropdownAlatUkurWidget({
    super.key,
    required this.items,
    required this.itemsId,
    this.onChanged,
    required this.hint,
    // this.validator,
    this.value,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      isExpanded: true,
      style: AppTextStyles.primaryTextNormal.copyWith(
        fontSize: 12,
      ),
      value: value?.id, // Ini bisa null
      hint: Text(
        hint,
        style: AppTextStyles.secoundaryTextNormal.copyWith(
          fontSize: 12,
        ),
      ),
      buttonStyleData: ButtonStyleData(
        elevation: 0,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: backgroundWhite10,
        ),
        elevation: 0,
      ),
      items: itemsId.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(items.firstWhere((value) => value.id == item).alatPengukuranAdmin.jenisAlat),
        );
      }).toList(),
      onChanged: onChanged,
      onSaved: onSaved,
      // validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey,
            ),
        filled: true,
        fillColor: backgroundWhite10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: redPrimaryMain),
        ),
      ),
    );
  }
}
