import 'package:flutter/cupertino.dart';
import 'package:markt/token/token_manage.dart';

class RouteGuard extends RouteObserver<PageRoute<dynamic>> {

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    super.didPush(route, previousRoute);

    final List<String> routesRequiringToken = ['/lobby'];

    if (routesRequiringToken.contains(route.settings.name)) {

      final BuildContext currentContext = route.navigator!.context;
      final bool isTokenValid = await TokenManager.isTokenValid();

      if (!isTokenValid) {
        Navigator.of(currentContext).pushReplacementNamed('/login');
      }
    }
  }



}
