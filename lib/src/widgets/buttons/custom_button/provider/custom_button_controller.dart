import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/provider/custom_button_state.dart';

part 'custom_button_controller.g.dart';

@riverpod
class CustomButtonController extends _$CustomButtonController {
  @override
  FutureOr<CustomButtonState> build() => CustomButtonState.init();

  onTap(Future<void> Function() callback, ) async {
    state = const AsyncValue.loading();
    await callback();
    _setState(state.value!);
  }

  _setState(CustomButtonState newState) => state = AsyncValue.data(newState);
}
