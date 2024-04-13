import 'package:calculator_flutter_app/common/widgets/phone_input/countries.dart';
import 'package:calculator_flutter_app/common/widgets/phone_input/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickerDialogStyle {
  final Color? backgroundColor;

  final TextStyle? countryCodeStyle;

  final TextStyle? countryNameStyle;

  final Widget? listTileDivider;

  final EdgeInsets? listTilePadding;

  final EdgeInsets? padding;

  final Color? searchFieldCursorColor;

  final InputDecoration? searchFieldInputDecoration;

  final EdgeInsets? searchFieldPadding;

  final double? width;

  PickerDialogStyle({
    this.backgroundColor,
    this.countryCodeStyle,
    this.countryNameStyle,
    this.listTileDivider,
    this.listTilePadding,
    this.padding,
    this.searchFieldCursorColor,
    this.searchFieldInputDecoration,
    this.searchFieldPadding,
    this.width,
  });
}

class CountryPickerDialog extends StatefulWidget {
  final List<Country> countryList;
  final Country selectedCountry;
  final ValueChanged<Country> onCountryChanged;
  final String searchText;
  final List<Country> filteredCountries;
  final PickerDialogStyle? style;
  final String languageCode;
  final bool isModalSheet;
  final Widget? closeIcon;
  final Color? iconColor;
  final String? title;
  final TextStyle? titleStyle;

  const CountryPickerDialog({
    required this.searchText,
    required this.languageCode,
    required this.countryList,
    required this.onCountryChanged,
    required this.selectedCountry,
    required this.filteredCountries,
    required this.isModalSheet,
    Key? key,
    this.closeIcon,
    this.iconColor,
    this.style,
    this.title,
    this.titleStyle,
  }) : super(key: key);

  @override
  State<CountryPickerDialog> createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country> _filteredCountries;
  late Country _selectedCountry;

  @override
  void initState() {
    _selectedCountry = widget.selectedCountry;
    _filteredCountries = widget.filteredCountries.toList()
      ..sort(
        (a, b) => a
            .localizedName(widget.languageCode)
            .compareTo(b.localizedName(widget.languageCode)),
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final width = widget.style?.width ?? mediaWidth;
    const defaultHorizontalPadding = 40.0;
    const defaultVerticalPadding = 24.0;

    return widget.isModalSheet
        ? GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: buildContainerContent(context),
            ),
          )
        : Dialog(
            insetPadding: EdgeInsets.symmetric(
                vertical: defaultVerticalPadding,
                horizontal: mediaWidth > (width + defaultHorizontalPadding * 2)
                    ? (mediaWidth - width) / 2
                    : defaultHorizontalPadding),
            backgroundColor: widget.style?.backgroundColor,
            child: buildContainerContent(context),
          );
  }

  Widget buildContainerContent(BuildContext context) {
    return Container(
      padding: widget.style?.padding ?? const EdgeInsets.all(10),
      child: Column(
        children: [
          widget.closeIcon ??
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: widget.iconColor ?? Colors.blue,
                  radius: 12,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: EdgeInsets.all(2.r),
                      child: Icon(
                        Icons.close,
                        size: 18.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          if (widget.title != null)
            Text(
              widget.title!,
              style: widget.titleStyle ??
                  TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          if (widget.title != null) SizedBox(height: 12.h),
          Padding(
            padding:
                widget.style?.searchFieldPadding ?? const EdgeInsets.all(0),
            child: TextField(
              cursorColor: widget.style?.searchFieldCursorColor,
              decoration: widget.style?.searchFieldInputDecoration ??
                  InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    labelText: widget.searchText,
                  ),
              onChanged: (value) {
                _filteredCountries = widget.countryList.stringSearch(value)
                  ..sort(
                    (a, b) => a
                        .localizedName(widget.languageCode)
                        .compareTo(b.localizedName(widget.languageCode)),
                  );
                if (mounted) setState(() {});
              },
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredCountries.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    leading: Text(
                      _filteredCountries[index].flag,
                      style: const TextStyle(fontSize: 18),
                    ),
                    contentPadding: widget.style?.listTilePadding,
                    title: Text(
                      _filteredCountries[index]
                          .localizedName(widget.languageCode),
                      style: widget.style?.countryNameStyle ??
                          const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    trailing: Text(
                      '+${_filteredCountries[index].dialCode}',
                      style: widget.style?.countryCodeStyle ??
                          const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    onTap: () {
                      _selectedCountry = _filteredCountries[index];
                      widget.onCountryChanged(_selectedCountry);
                      Navigator.of(context).pop();
                    },
                  ),
                  widget.style?.listTileDivider ?? const Divider(thickness: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
