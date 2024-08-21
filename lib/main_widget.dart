import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'main_routes.dart';
import 'managers/board.dart';
import 'managers/next_direction.dart';
import 'managers/round.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  void initState() {
    Modular.setInitialRoute(MainRoutes.game);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoundCubit>(
          create: (context) => roundCubit,
        ),
        BlocProvider<NextDirectionCubit>(
          create: (context) => nextDirectionCubit,
        ),
        BlocProvider<BoardCubit>(
          create: (context) => boardCubit,
        ),
      ],
      child: MaterialApp.router(
        title: '2048',
        debugShowCheckedModeBanner: false,
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
