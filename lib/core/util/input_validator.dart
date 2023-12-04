// ignore_for_file: unnecessary_string_escapes

import 'dart:async';

mixin EmptyStringValidator {
  final StreamTransformer<String?, String> validateEmptyString =
      StreamTransformer<String?, String>.fromHandlers(
          handleData: (value, sink) {
    if (value == null || value.isEmpty) {
      sink.addError('Vui lòng nhập thông tin');
    } else {
      sink.add(value);
    }
  });
}

mixin PasswordValidator {
  final StreamTransformer<String?, String> validatePassword =
      StreamTransformer<String?, String>.fromHandlers(
    handleData: (password, sink) {
      String p =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      final regExp = RegExp(p);
      if (password == null || password.isEmpty) {
        sink.addError('Mật khẩu không được để trống');
      } else if (password.length < 8 || password.length > 10) {
        sink.addError(
            "Mật khẩu chưa đúng yêu cầu, cần đặt lại mật khẩu theo quy định 'mật khẩu theo quy định tối thiểu 8 ký tự, tối đa 10 ký tự, bao gồm chữ, số, ký tự đặc biệt, không bao gồm dấu cách'");
      } else if (!regExp.hasMatch(password)) {
        sink.addError(
            "Mật khẩu chưa đúng yêu cầu, cần đặt lại mật khẩu theo quy định 'mật khẩu theo quy định tối thiểu 8 ký tự, tối đa 10 ký tự, bao gồm chữ, số, ký tự đặc biệt, không bao gồm dấu cách'");
      } else if (password.contains(' ')) {
        sink.addError(
            "Mật khẩu chưa đúng yêu cầu, cần đặt lại mật khẩu theo quy định 'mật khẩu theo quy định tối thiểu 8 ký tự, tối đa 10 ký tự, bao gồm chữ, số, ký tự đặc biệt, không bao gồm dấu cách'");
      } else {
        sink.add(password);
      }
    },
  );
}

mixin NumberPhoneEnsignValidator {
  final StreamTransformer<String, String> validatePhone =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (number, sink) {
      const p = r'(^(?:[+0]9)?[0-9]{11}$)';
      // ignore: omit_local_variable_types
      final regExp = RegExp(p);
      if (number.isEmpty) {
        sink.addError('Số điện thoại không được để trống');
      } else if (!regExp.hasMatch(number)) {
        sink.addError('Số điện thoại không đúng định dạng');
      } else {
        sink.add(number);
      }
    },
  );
}

mixin NumberPhoneValidator {
  final StreamTransformer<String, String> validatePhone =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (number, sink) {
      const p = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      // ignore: omit_local_variable_types
      final regExp = RegExp(p);
      if (number.isEmpty) {
        sink.addError('Số điện thoại không được để trống');
      } else if (!regExp.hasMatch(number)) {
        sink.addError('Số điện thoại không đúng định dạng');
      } else {
        sink.add(number);
      }
    },
  );
}

mixin DateValidator {
  final StreamTransformer<String, String> validateDate =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (date, sink) {
      const p = r'^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$';
      // const p = r'^\d{4}-\d{2}-\d{2}$';
      final regExp = RegExp(p);
      if (!regExp.hasMatch(date)) {
        sink.addError('Ngày không đúng định dạng');
      } else {
        sink.add(date);
      }
    },
  );
}

mixin EmailValidator {
  final StreamTransformer<String?, String> validateEmail =
      StreamTransformer<String?, String>.fromHandlers(
    handleData: (email, sink) {
      const p =
          '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+';
      final regExp = RegExp(p);
      if (email == null || email.isEmpty) {
        sink.addError('Email không được để trống');
      } else if (!regExp.hasMatch(email)) {
        sink.addError('Email không đúng định dạng');
      } else {
        sink.add(email);
      }
    },
  );
}
