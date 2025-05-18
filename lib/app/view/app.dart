import 'package:api_repository/api_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_clone/app/view/app_view.dart';
import 'package:flutter_instagram_clone/todos/cubit/todos_cubit.dart';

class App extends StatelessWidget {
  const App({required ApiRepository apiRepository, super.key})
      : _apiRepository = apiRepository;

  final ApiRepository _apiRepository;

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => TodosCubit(apiRepository: _apiRepository),
    //   child: const AppView(),
    // );

    // Alternate way to provide the repository to
    // the child widgets. This will allow us to easily
    // provide multiple repositories using the MultiRepositoryProvider
    // later, and then the individual pages will provide just the
    // repository that it needs to its children.
    return RepositoryProvider.value(
      value: _apiRepository,
      child: const AppView(),
    );
  }
}
