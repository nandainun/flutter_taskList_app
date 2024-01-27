part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;

  const SwitchState(this.switchValue);

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      map['switchValue'] ?? false,
    );
  }
}

final class SwitchInitial extends SwitchState {
  const SwitchInitial(super.switchValue);
}
