part of 'singup_view.dart';

class SignupData {
  String email = '';
  String password = '';
  DateTime? birthDate;
  int heightFt = 5;
  int heightIn = 7;
}

abstract class SignupViewProps extends State<SignupView> {
  final _pageController = PageController();
  final _data = SignupData();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  int _page = 0;

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool get _canContinue {
    switch (_page) {
      case 0:
        final email = _emailController.text.trim();

        return email.isNotEmpty &&
            RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);

      case 1:
        return _passwordController.text.isNotEmpty &&
            _passwordController.text == _confirmPasswordController.text &&
            _isValidPassword(_passwordController.text);

      default:
        return true;
    }
  }

  bool _isValidPassword(String value) {
    return value.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(value) &&
        RegExp(r'[a-z]').hasMatch(value) &&
        RegExp(r'[0-9]').hasMatch(value) &&
        RegExp(r'[^A-Za-z0-9]').hasMatch(value);
  }

  void _next() {
    if (!_canContinue) return;

    FocusManager.instance.primaryFocus?.unfocus();

    if (_page == 1) {
      _submit();
      return;
    }

    setState(() => _page++);

    _pageController.animateToPage(
      _page,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void _back() {
    if (_page == 0) return;

    FocusManager.instance.primaryFocus?.unfocus();

    setState(() => _page--);

    _pageController.animateToPage(
      _page,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void _submit() {
    AppRouter.replaceAll(AppRouter.ringFlow);
  }
}
