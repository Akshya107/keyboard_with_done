import 'package:flutter/cupertino.dart';



class InputDoneButton extends StatelessWidget {
  InputDoneButton({Key? key,required this.style,}) : super(key: key);
  TextStyle style;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      color:const Color.fromRGBO(218, 218, 218, 1),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding:const  EdgeInsets.symmetric(vertical: 4),
          child: CupertinoButton(
            padding: const EdgeInsets.only(top: 8,right: 24,bottom: 8),
            onPressed: (){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text(
              'Done',
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
