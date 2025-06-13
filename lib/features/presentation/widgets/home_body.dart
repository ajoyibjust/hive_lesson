import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_lesson/core/services/dependency_injection_instance.dart';
import 'package:hive_lesson/features/presentation/bloc/products_bloc.dart';
import 'package:hive_lesson/features/presentation/bloc/products_event.dart';
import 'package:hive_lesson/features/presentation/bloc/products_state.dart';
import 'package:hive_lesson/features/presentation/widgets/products.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            BlocProvider(
              create: (context) =>
                  sl<ProductsBloc>()..add(ProductsFetchEvent()),
              child: Builder(
                builder: (context) {
                  return BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsFailureState) {
                        return SizedBox();
                      }
                      if (state is ProductLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ProductsSuccesState) {
                        return Products(products: state.data.data);
                      }
                      return SizedBox();
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
