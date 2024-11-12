// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../input_base.dart';

class _InputGender extends StatefulWidget {
  final List<String>? items;
  final void Function(String val)? onCompleted;
  const _InputGender({
    super.key,
    this.items,
    this.onCompleted,
  });

  @override
  State<_InputGender> createState() => __InputGenderState();
}

class __InputGenderState extends State<_InputGender> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.items != null ? widget.items!.length : 0,
          (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              if (widget.onCompleted != null) {
                widget.onCompleted!(widget.items![index]);
              }
            });
          },
          child: Padding(
            padding: _customPadding(index),
            child: Container(
              constraints: BoxConstraints(minWidth: 75.w),
              //height: 40.h,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: selectedIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.14),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: Center(
                  child: Text(
                    widget.items![index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  EdgeInsets _customPadding(int val) {
    int lastIndex = widget.items!.length - 1;
    if (val == 0) {
      return EdgeInsets.only(right: 8.0.w);
    } else if (val == lastIndex) {
      return EdgeInsets.only(left: 8.0.w);
    } else {
      return EdgeInsets.symmetric(horizontal: 8.0.w);
    }
  }
}
