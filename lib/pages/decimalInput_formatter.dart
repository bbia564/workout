
import 'package:flutter/services.dart';

class DecimalInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.contains('.') && newValue.text.split('.').last.contains('.')) {
      // 如果小数点后已经存在小数点，则阻止输入  
      return oldValue;
    }

    // 你可以在这里添加更多的逻辑，例如限制小数位数  

    return newValue;
  }
}
