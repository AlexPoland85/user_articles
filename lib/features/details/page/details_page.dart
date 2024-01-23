import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_articles/app/core/enums.dart';
import 'package:user_articles/app/injection_container.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/models/details_model.dart';
import 'package:user_articles/features/details/cubit/details_cubit.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final ArticleModel id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: BlocProvider<DetailsCubit>(
        create: (context) => getIt()
          ..fetchData(
            id: id.id,
          ),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<DetailsCubit, DetailsState>(
                builder: (context, state) {
                  switch (state.status) {
                    case Status.initial:
                      return const Center(
                        child: Text('Initial state'),
                      );
                    case Status.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.success:
                      if (state.results.isEmpty) {
                        return const Center(
                          child: Text('No Details found'),
                        );
                      }
                      return ListView(
                        children: [
                          for (final id in state.results)
                            _DetailsItemWidget(
                              model: id,
                            ),
                        ],
                      );
                    case Status.error:
                      return Center(
                        child: Text(
                          state.errorMessage ?? 'Unknown error',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsItemWidget extends StatelessWidget {
  const _DetailsItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final DetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        color: Colors.black12,
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Text(model.content),
            ),
          ],
        ),
      ),
    );
  }
}
