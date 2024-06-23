import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stockeep/const.dart';

// ignore: must_be_immutable
class custom_dropdownbutton extends StatefulWidget {
  custom_dropdownbutton(
      {super.key,
      this.onchange,
      required this.items,
      required this.selectedvalue,
      required this.icon,
      required this.hint});
  List<String> items;

  IconData icon;
  List<String?> selectedvalue;
  String hint;
  void Function()? onchange;

  @override
  State<custom_dropdownbutton> createState() => _custom_dropdownbuttonState();
}

class _custom_dropdownbuttonState extends State<custom_dropdownbutton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Icon(
                  widget.icon,
                  size: 14,
                  color: primarycolor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.hint,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            items: widget.items.map((item) {
              return DropdownMenuItem(
                value: item,
                //disable default onTap to avoid closing menu when selecting an item
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final isSelected = widget.selectedvalue.contains(item);
                    return InkWell(
                      onTap: () {
                        isSelected
                            ? widget.selectedvalue.remove(item)
                            : widget.selectedvalue.add(item);
                        //This rebuilds the StatefulWidget to update the button's text
                        widget.onchange!();
                        setState(() {});
                        //This rebuilds the dropdownMenu Widget to update the check mark
                        menuSetState(() {});
                      },
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            if (isSelected)
                              const Icon(FontAwesomeIcons.solidSquareCheck,
                                  color: Colors.blue)
                            else
                              const Icon(
                                FontAwesomeIcons.squareCheck,
                                color: Colors.blue,
                              ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
            value:
                widget.selectedvalue.isEmpty ? null : widget.selectedvalue.last,
            onChanged: (val) {},
            selectedItemBuilder: (context) {
              return widget.items.map(
                (item) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      widget.selectedvalue.join(', '),
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                  color: color2, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: color2,
              ),
            )),
      ),
    );
  }
}
