




import 'dart:async';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app/components/colors.dart';
import 'package:you_app/home/controller/home_controller.dart';

// import '../controller/home_controller.dart';




const List<String> interestChoiseList = <String>[
  // 'Music',
  // 'Basketball',
  // 'Fitness',
  // 'Gymming',
  // 'Cycling',
];

class InterestInputPage extends StatefulWidget {
  const InterestInputPage({super.key});

  @override
  InterestInputPageState createState() {
    return InterestInputPageState();
  }
}

class InterestInputPageState extends State<InterestInputPage> {




  HomeController homeController=Get.put(HomeController());
  final FocusNode _chipFocusNode = FocusNode();

  List<String> _suggestions = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        decoration: loginDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 70,),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Row(

                      children: [
                        Icon(Icons.arrow_back_ios,size: 14,color: Colors.white,),
                        Text('Back',style:GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),)
                      ],),
                  ),

                  InkWell(
                    onTap: (){

                      Get.back();
                      homeController.updateProfile();

                    },
                    child: Text('Save',style:GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),),
                  ),










                ],
              ),
            ),



            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 73),
              child: Text('Tell everyone about yourself',style:GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 35),
              child: Text('What interest you?',style:GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),
            ),


            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(.7)
              ),
              child: ChipsInput<String>(
                values: homeController.interestSelectionList,
                decoration:  InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search for interest',
                ),
                strutStyle: const StrutStyle(fontSize: 15),
                onChanged: _onChanged,
                onSubmitted: _onSubmitted,
                chipBuilder: _chipBuilder,
                onTextChanged: _onSearchChanged,
              ),
            ),
            if (_suggestions.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _suggestions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ToppingSuggestion(
                      _suggestions[index],
                      onTap: _selectSuggestion,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSearchChanged(String value) async {
    final List<String> results = await _suggestionCallback(value);
    setState(() {
      _suggestions = results
          .where((String topping) => !homeController.interestSelectionList.contains(topping))
          .toList();
    });
  }

  Widget _chipBuilder(BuildContext context, String topping) {
    return ToppingInputChip(
      topping: topping,
      onDeleted: _onChipDeleted,
      onSelected: _onChipTapped,
    );
  }

  void _selectSuggestion(String topping) {
    setState(() {
      homeController.interestSelectionList.add(topping);
      _suggestions = <String>[];
    });
  }

  void _onChipTapped(String topping) {}

  void _onChipDeleted(String topping) {
    setState(() {
      homeController.interestSelectionList.remove(topping);
      _suggestions = <String>[];
    });
  }

  void _onSubmitted(String text) {
    if (text.trim().isNotEmpty) {
      setState(() {
        homeController.interestSelectionList = <String>[...homeController.interestSelectionList, text.trim()];
      });
    } else {
      _chipFocusNode.unfocus();
      setState(() {
        homeController.interestSelectionList = <String>[];
      });
    }
  }

  void _onChanged(List<String> data) {
    setState(() {
      homeController.interestSelectionList = data;
    });
  }

  FutureOr<List<String>> _suggestionCallback(String text) {
    if (text.isNotEmpty) {
      return interestChoiseList.where((String topping) {
        return topping.toLowerCase().contains(text.toLowerCase());
      }).toList();
    }
    return const <String>[];
  }
}

class ChipsInput<T> extends StatefulWidget {
  const ChipsInput({
    super.key,
    required this.values,
    this.decoration = const InputDecoration(),
    this.style,
    this.strutStyle,
    required this.chipBuilder,
    required this.onChanged,
    this.onChipTapped,
    this.onSubmitted,
    this.onTextChanged,
  });

  final List<T> values;
  final InputDecoration decoration;
  final TextStyle? style;
  final StrutStyle? strutStyle;

  final ValueChanged<List<T>> onChanged;
  final ValueChanged<T>? onChipTapped;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onTextChanged;

  final Widget Function(BuildContext context, T data) chipBuilder;

  @override
  ChipsInputState<T> createState() => ChipsInputState<T>();
}

class ChipsInputState<T> extends State<ChipsInput<T>> {
  @visibleForTesting
  late final ChipsInputEditingController<T> controller;

  String _previousText = '';
  TextSelection? _previousSelection;

  @override
  void initState() {
    super.initState();

    controller = ChipsInputEditingController<T>(
      <T>[...widget.values],
      widget.chipBuilder,
    );
    controller.addListener(_textListener);
  }

  @override
  void dispose() {
    controller.removeListener(_textListener);
    controller.dispose();

    super.dispose();
  }

  void _textListener() {
    final String currentText = controller.text;

    if (_previousSelection != null) {
      final int currentNumber = countReplacements(currentText);
      final int previousNumber = countReplacements(_previousText);

      final int cursorEnd = _previousSelection!.extentOffset;
      final int cursorStart = _previousSelection!.baseOffset;

      final List<T> values = <T>[...widget.values];

      // If the current number and the previous number of replacements are different, then
      // the user has deleted the InputChip using the keyboard. In this case, we trigger
      // the onChanged callback. We need to be sure also that the current number of
      // replacements is different from the input chip to avoid double-deletion.
      if (currentNumber < previousNumber && currentNumber != values.length) {
        if (cursorStart == cursorEnd) {
          values.removeRange(cursorStart - 1, cursorEnd);
        } else {
          if (cursorStart > cursorEnd) {
            values.removeRange(cursorEnd, cursorStart);
          } else {
            values.removeRange(cursorStart, cursorEnd);
          }
        }
        widget.onChanged(values);
      }
    }

    _previousText = currentText;
    _previousSelection = controller.selection;
  }

  static int countReplacements(String text) {
    return text.codeUnits
        .where(
            (int u) => u == ChipsInputEditingController.kObjectReplacementChar)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    controller.updateValues(<T>[...widget.values]);

    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,

      ),
      minLines: 1,
      maxLines: 3,
      textInputAction: TextInputAction.done,
      style: TextStyle(
        color: Colors.white
      ),
      strutStyle: widget.strutStyle,
      controller: controller,
      onChanged: (String value) =>
          widget.onTextChanged?.call(controller.textWithoutReplacements),
      onSubmitted: (String value) =>
          widget.onSubmitted?.call(controller.textWithoutReplacements),
    );
  }
}

class ChipsInputEditingController<T> extends TextEditingController {
  ChipsInputEditingController(this.values, this.chipBuilder)
      : super(
    text: String.fromCharCode(kObjectReplacementChar) * values.length,
  );

  // This constant character acts as a placeholder in the TextField text value.
  // There will be one character for each of the InputChip displayed.
  static const int kObjectReplacementChar = 0xFFFE;

  List<T> values;

  final Widget Function(BuildContext context, T data) chipBuilder;

  /// Called whenever chip is either added or removed
  /// from the outside the context of the text field.
  void updateValues(List<T> values) {
    if (values.length != this.values.length) {
      final String char = String.fromCharCode(kObjectReplacementChar);
      final int length = values.length;
      value = TextEditingValue(
        text: char * length,
        selection: TextSelection.collapsed(offset: length),
      );
      this.values = values;
    }
  }

  String get textWithoutReplacements {
    final String char = String.fromCharCode(kObjectReplacementChar);
    return text.replaceAll(RegExp(char), '');
  }

  String get textWithReplacements => text;

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
        TextStyle? style,
        required bool withComposing}) {
    final Iterable<WidgetSpan> chipWidgets =
    values.map((T v) => WidgetSpan(child: chipBuilder(context, v)));

    return TextSpan(
      style: style,
      children: <InlineSpan>[
        ...chipWidgets,
        if (textWithoutReplacements.isNotEmpty)
          TextSpan(text: textWithoutReplacements)
      ],
    );
  }
}

class ToppingSuggestion extends StatelessWidget {
  const ToppingSuggestion(this.topping, {super.key, this.onTap});

  final String topping;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ObjectKey(topping),
      // leading: CircleAvatar(
      //   child: Text(
      //     topping[0].toUpperCase(),
      //   ),
      // ),
      title: Text(topping,style:GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white
      ),),
      onTap: () => onTap?.call(topping),
    );
  }
}

class ToppingInputChip extends StatelessWidget {
  const ToppingInputChip({
    super.key,
    required this.topping,
    required this.onDeleted,
    required this.onSelected,
  });

  final String topping;
  final ValueChanged<String> onDeleted;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      child: InputChip(
        backgroundColor: Colors.grey,
        key: ObjectKey(topping),
        label: Text(topping,style:GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white
        ),),
        // avatar: CircleAvatar(
        //   child: Text(topping[0].toUpperCase()),
        // ),
        onDeleted: () => onDeleted(topping),
        onSelected: (bool value) => onSelected(topping),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(2),
      ),
    );
  }
}
