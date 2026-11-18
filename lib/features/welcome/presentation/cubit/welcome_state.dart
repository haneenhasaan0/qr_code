class WelcomeState {}

class WelcomeInit extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}
class WelcomeShow extends WelcomeState {
  WelcomeShow({required this.daysSinceHire, required this.daysLeft});
  final int daysSinceHire;
  final int daysLeft;
}
class WelcomeHidden extends WelcomeState {}
