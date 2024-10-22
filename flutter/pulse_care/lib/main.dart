import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_care/api/mock_api.dart';
import 'package:pulse_care/components/theme/theme.dart';
import 'package:pulse_care/features/add_lab_request/add_lab_request_scree.dart';
import 'package:pulse_care/features/add_test/add_test_screen.dart';
import 'package:pulse_care/features/lab_request_list/lab_request_list_screen.dart';
import 'package:pulse_care/features/lab_test_list/lab_test_list.dart';

import 'features/view_lab_test_request/view_lab_test_request_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: const AppTheme().dark(),
      routerConfig: AppRouter().router,
    );
  }
}

final class AppRouter {
  static const home = '/home';
  static const labRequestList = '/lab-request-list';
  static const addRequest = '/add-request';
  static const addTest = '/add-test';

  AppRouter() : api = MockApi();

  final MockApi api;

  GoRouter get router => GoRouter(
        initialLocation: home,
        routes: [
          GoRoute(
            path: home,
            builder: (context, state) => LabTestListScreen(
              api: api,
              onLapRequest: () => context.go(labRequestList),
              onCreateNewTest: () => context.go(addTest),
            ),
          ),

          //
          GoRoute(
            path: labRequestList,
            builder: (context, state) => LabRequestListScreen(
              api: api,
              onAddLabRequest: () => context.go(addRequest),
              onViewLabRequest: (id) => context.go('$labRequestList/$id'),
            ),
          ),

          //
          GoRoute(
            path: addRequest,
            builder: (context, state) => AddLabRequestScreen(api: api),
          ),

          //
          GoRoute(
            path: '$labRequestList/:id',
            builder: (context, state) {
              final id = state.pathParameters["id"]!;

              return LabTestRequestDetailsScreen(
                labTestRequestId: id,
                api: api,
              );
            },
          ),

          //
          GoRoute(
            path: addTest,
            builder: (context, state) => AddTestScreen(api: api),
          ),
        ],
      );
}
