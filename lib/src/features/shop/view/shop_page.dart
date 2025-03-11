import 'package:e_commerce/src/features/products_overview/cubit/products_overview_cubit.dart';
import 'package:e_commerce/src/features/shop/cubit/category_cubit.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card_section.dart';
import 'package:e_commerce/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoryCubit(),
        ),
      ],
      child: ShopView(),
    );
  }
}

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Categories'),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          body: state.status.isLoading
              ? XStateLoadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 18),
                        child: Text(
                          "Choose category",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      XCardSection(
                        borderColor: AppColors.background,
                        children:
                            List.generate(state.categories.length, (index) {
                          final category = state.categories[index];
                          return XCardSectionButton(
                            title: category.name!,
                            onTap: () async {
                              AppCoordinator.showProductList(context);
                              await context
                                  .read<CategoryCubit>()
                                  .onSelectedCategoryChanged(category);
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
