import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_button_state.freezed.dart';

@freezed
sealed class CustomButtonState with _$CustomButtonState {
  const factory CustomButtonState() = _CustomButtonState;

  factory CustomButtonState.init() => CustomButtonState();
}
