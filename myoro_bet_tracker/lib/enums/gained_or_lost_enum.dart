enum GainedOrLostEnum {
  gained('Gained'),
  lost('Lost'),
  pending('Pending');

  final String result;

  const GainedOrLostEnum(this.result);
}
