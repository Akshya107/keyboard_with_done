library keyboard_with_done;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_with_done/done_button.dart';

class CustomIosKeyboard extends StatefulWidget {
  TextStyle doneTextStyle;
  FocusNode focusNode;
 TextEditingController controller ;
  ValueChanged<String>? onChanged;
  ValueChanged<String>? onFieldSubmitted;
      FormFieldSetter<String>? onSaved;
  FormFieldValidator<String>? validator;
      List<TextInputFormatter>? inputFormatters;
  VoidCallback? onEditingComplete;
  bool? decimal;
  InputDecoration? decoration = const InputDecoration();
  TextStyle? style;
  bool? autofocus;
  Color? cursorColor;
  int? maxLength;

 CustomIosKeyboard({Key? key,

   required this.doneTextStyle,
   required this.focusNode,
   required this.controller,
   this.onChanged,
   this.inputFormatters,
   this.onFieldSubmitted,
   this.onSaved,
   this.validator,
  this.onEditingComplete,
   this.decimal,
   this.decoration,
   this.style,
   this.cursorColor,
   this.autofocus,
   this.maxLength
  }) : super(key: key);

  @override
  State<CustomIosKeyboard> createState() => _CustomIosKeyboardState();
}

class _CustomIosKeyboardState extends State<CustomIosKeyboard> {
  OverlayEntry?  overlayEntry ;

  void showOverlay(BuildContext context){
    overlayEntry  = OverlayEntry(builder: (BuildContext context){
      return Positioned(bottom: MediaQuery.of(context).viewInsets.bottom, child: InputDoneButton(
        style: widget.doneTextStyle,

      ));
    });
    OverlayState? overlayState = Overlay.of(context);
    overlayState?.insert(overlayEntry!);

  }

  void  removeOverlay(){
    if(overlayEntry != null){
      overlayEntry!.remove();
      overlayEntry = null;
    }

  }
  @override
  void initState() {
    widget.focusNode.addListener(() {
      if(widget.focusNode.hasFocus){
        showOverlay(context);
      }else{
        removeOverlay();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      keyboardType:TextInputType.numberWithOptions(
          decimal: widget.decimal ?? false
      ),
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onFieldSubmitted:  widget.onFieldSubmitted,
      onEditingComplete:widget.onEditingComplete ,
      controller: widget.controller,
      validator: widget.validator,
      inputFormatters:widget.inputFormatters,
      decoration: widget.decoration,
      style: widget.style,
      autofocus:widget.autofocus ?? false ,
      cursorColor: widget.cursorColor,
      maxLength: widget.maxLength,
    );
  }
}

