
import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';

class TimePickerBottomSheet extends StatefulWidget {
  final TimeOfDay? initialTime;
  final Function(TimeOfDay)? onTimeSelected;

  const TimePickerBottomSheet({Key? key, this.initialTime, this.onTimeSelected})
      : super(key: key);

  @override
  State<TimePickerBottomSheet> createState() => _TimePickerBottomSheetState();
}

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  late int _selectedHour;
  late int _selectedMinute;
  late bool _isAm;

  @override
  void initState() {
    super.initState();
    final initialTime =
        widget.initialTime ?? const TimeOfDay(hour: 12, minute: 0);
    _selectedHour = initialTime.hourOfPeriod;
    _selectedMinute = initialTime.minute;
    _isAm = initialTime.period == DayPeriod.am;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSpace(30),

          // Set Time Label
          _buildSetTimeLabel(),
          VSpace(30),

          // Time Picker
          _buildTimePicker(),
          const SizedBox(height: 32),

          // Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }


  Widget _buildSetTimeLabel() {
    return Text(
      'Set Time',
      textAlign: TextAlign.center,
      style: AppCss.soraMedium24,
    ).alignment(Alignment.center);
  }

  Widget _buildTimePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Hours Picker
        _buildNumberPicker(
          title: 'Hours',
          minValue: 1,
          maxValue: 12,
          value: _selectedHour,
          onChanged: (value) => setState(() => _selectedHour = value),
        ),

        // Minutes Picker
        _buildNumberPicker(
          title: 'Minutes',
          minValue: 0,
          maxValue: 59,
          value: _selectedMinute,
          onChanged: (value) => setState(() => _selectedMinute = value),
        ),

        // AM/PM Picker
        _buildAmPmPicker(),
      ],
    ).decorated(color: AppColors.grey, borderRadius: BorderRadius.circular(12));
  }

  Widget _buildNumberPicker({
    required String title,
    required int minValue,
    required int maxValue,
    required int value,
    required ValueChanged<int> onChanged,
  }) {
    return Expanded(
      child: Column(
        children: [
          VSpace(16),
          SizedBox(
            height: 200, // Increased height to show 3-4 items
            width: 102,

            child: Stack(
              children: [
                // Selection highlight background
                Positioned(
                  top: 80, // (180 - 50) / 2 = 65
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 102,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                  ),
                ),

                ListWheelScrollView(
                  diameterRatio: 4,
                  perspective: 0.005,
                  offAxisFraction: 0.0,
                  itemExtent: 50,
                  squeeze: 1.0,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    onChanged(minValue + index);
                  },
                  children: List.generate(maxValue - minValue + 1, (index) {
                    final number = minValue + index;
                    final isSelected = number == value;
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        number.toString().padLeft(2, '0'),
                        style: isSelected
                            ? AppCss.soraSemiBold16.copyWith(
                          color: AppColors.primaryColor,
                        )
                            : AppCss.soraRegular16,
                        /*TextStyle(
                            fontSize: isSelected ? 22 : 18,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected ? Colors.blue : Colors.grey[700],
                          ),*/
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmPmPicker() {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 200, // Increased height to show 3-4 items
            width: 102,

            child: Stack(
              children: [
                // Selection highlight background
                Positioned(
                  top: 88, // (180 - 50) / 2 = 65
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 102,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                  ),
                ),

                Container(
                  height: 200,
                  child: ListWheelScrollView(
                    diameterRatio: 4,
                    perspective: 0.005,
                    offAxisFraction: 0.0,
                    itemExtent: 50,
                    squeeze: 1.0,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() => _isAm = index == 0);
                    },
                    children: [
                      _buildAmPmItem('Am', true),
                      _buildAmPmItem('Pm', false),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /*    Container(
            height: 180,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: ListWheelScrollView(
              diameterRatio: 1.2,
              perspective: 0.005,
              offAxisFraction: 0.0,
              itemExtent: 50,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() => _isAm = index == 0);
              },
              children: [
                _buildAmPmItem('Am', true),
                _buildAmPmItem('Pm', false),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildAmPmItem(String text, bool isAm) {
    final isSelected = _isAm == isAm;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: isSelected
            ? AppCss.soraSemiBold16.copyWith(color: AppColors.primaryColor)
            : AppCss.soraRegular16,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: appButton(

            Fonts.cancel.tr,
            color: AppColors.lightPrimaryColor,
            style: AppCss.soraMedium16,
            onTap: () {
              Get.back();
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: appButton(
            Fonts.apply.tr,
            color: AppColors.primaryColor,
            onTap: (){
              Get.back(result: "$_selectedHour:$_selectedMinute ${_isAm? "AM":"PM"}");
            },
            style: AppCss.soraMedium16.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }

  void _applyTime() {
    final hour = _isAm ? _selectedHour : _selectedHour + 12;
    final time = TimeOfDay(hour: hour, minute: _selectedMinute);

    widget.onTimeSelected?.call(time);
    Navigator.pop(context);
  }
}