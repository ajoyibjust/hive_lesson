import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_lesson/core/services/hive_product.dart';
import 'package:hive_lesson/features/presentation/blocs/add_card_bloc/add_card_bloc_bloc.dart';
import 'package:hive_lesson/features/presentation/blocs/add_card_bloc/add_card_bloc_event.dart';
import 'package:hive_lesson/features/presentation/blocs/add_card_bloc/add_card_bloc_state.dart';

class CardBody extends StatelessWidget {
  const CardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddCardBlocBloc(hiveProduct: HiveProduct())..add(LoadProductsEvent()),
      child: Scaffold(
        body: BlocBuilder<AddCardBlocBloc, AddCardBlocState>(
          builder: (context, state) {
            if (state is ProductInitial || state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is ProductLoaded) {
              return _buildProductGrid(state.products, context);
            }
            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }

  Widget _buildProductGrid(
    List<Map<String, dynamic>> products,
    BuildContext context,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 250,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 160,
                        child: Image.network(item['image'], fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 10),
                      Text(item['name']),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
