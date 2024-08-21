import 'package:flutter_modular/flutter_modular.dart';

import 'game.dart';
import 'main_routes.dart';
import 'managers/board.dart';
import 'managers/next_direction.dart';
import 'managers/round.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(() => NextDirectionCubit());
    i.addSingleton(() => RoundCubit());
    i.addSingleton(() => BoardCubit());
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child(
      MainRoutes.game,
      child: (context) => const Game(),
    );
  }
}
