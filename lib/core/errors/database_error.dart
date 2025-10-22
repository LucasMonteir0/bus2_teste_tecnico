import 'package:flutter/cupertino.dart';

import 'base_error.dart';

class DatabaseError extends BaseError {
  DatabaseError({super.message = "DatabaseError"}) : super(code: -1) {
    debugPrint(super.message);
  }

  @override
  List<Object?> get props => [message, code];
}
