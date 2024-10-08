import 'package:flutter/material.dart';

class FSTextFormField extends FormField<String> {
  FSTextFormField({
    super.key,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String initialValue = '',
    bool autovalidate = false,
    bool moneymask = false,
    TextEditingController? controller,
    bool enabled = true,
    bool dropdown = false,
    int? maxLength,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    String label = '',
    String counterText = '',
    bool obscureText = false,
    bool readonly = false,
    Function(String)? onChanged,
    Widget? suffixIcon,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          enabled: enabled,
          builder: (FormFieldState<String> state) {
            return _FSTextFormField(
              state: state,
              maxLength: maxLength,
              label: label,
              keyboardType: keyboardType,
              counterText: counterText,
              textCapitalization: textCapitalization,
              onChanged: onChanged,
              moneyMask: moneymask,
              controller: controller,
              enabled: enabled,
              dropdown: dropdown,
              obscureText: obscureText,
              suffixIcon: suffixIcon,
              readonly : readonly,
            );
          },
        );
}

class _FSTextFormField extends StatefulWidget {
  final int? maxLength;
  final String label;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final FormFieldState<String>? state;
  final String? counterText;
  final Function(String)? onChanged;
  final bool moneyMask;
  final TextEditingController? controller;
  final bool enabled;
  final bool dropdown;
  final bool obscureText;
  final bool readonly;
  final Widget? suffixIcon;

  const _FSTextFormField({
    this.maxLength,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.characters,
    this.state,
    this.counterText,
    this.onChanged,
    this.moneyMask = false,
    this.controller,
    this.enabled = true,
    this.dropdown = false,
    this.obscureText = false,
    this.suffixIcon,
    this.readonly=false
  });
  @override
  State<StatefulWidget> createState() => _FSTextFormFieldState();
}

class _FSTextFormFieldState extends State<_FSTextFormField> {
  TextEditingController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        widget.state!.didChange(widget.controller!.text);
      });
    } else {
      controller = TextEditingController(text: widget.state!.value ?? '');
      controller!.addListener(() {
        widget.state!.didChange(controller!.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          // decoration: BoxDecoration(
          //   color: Colors.grey[200],
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0, ),
            child: Stack(
              children: <Widget>[
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     widget.label,
                //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                //           color: widget.state!.hasError
                //               ? Theme.of(context).errorColor
                //               : Colors.black,
                //           fontSize: 15.0,
                //         ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: TextFormField(

                    controller: widget.controller ?? controller,
                    maxLength: widget.maxLength,
                    keyboardType: widget.keyboardType,
                    style: TextStyle(color: Colors.black,fontFamily: "Montserrat"),
                    textCapitalization: widget.textCapitalization,
                    onChanged: widget.onChanged,
                    enabled: widget.enabled,
                    readOnly: widget.readonly,
                    obscureText: widget.obscureText,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      suffixIcon: widget.suffixIcon,
                      // border: InputBorder.none,
                      // errorBorder: InputBorder.none,
                      // focusedBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      counterText: widget.counterText,
                      hintText: widget.label,
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      errorStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                    onEditingComplete: () {
                      widget.state!.didChange(controller!.text);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        widget.state!.hasError
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.state!.errorText!,
                    style: TextStyle(
                        color: Theme.of(context).errorColor, fontSize: 12.0, fontFamily: "Montserrat"),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
