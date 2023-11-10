import 'package:gweiland_flutter_task/utils/common_exports.dart';

class RoundedOutlineButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const RoundedOutlineButton({
    Key? key,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            BorderSide(color: AppConstants.lightgrey.withOpacity(0.3))),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
      ),
      child: child,
    );
  }
}
