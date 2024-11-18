import 'package:easy_bills/2_application/core/services/theme_service.dart';
import 'package:easy_bills/2_application/features/product_master/bloc/product_master_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class WrapperProviderScreenCreateUpdateProductMaster extends StatelessWidget {
  const WrapperProviderScreenCreateUpdateProductMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProductMasterBloc();
      },
      child: const ScreenCreateUpdateProductMaster(),
    );
  }
}

class ScreenCreateUpdateProductMaster extends StatelessWidget {
  const ScreenCreateUpdateProductMaster({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                return Provider.of<ThemeService>(context, listen: false)
                    .toggleTheme();
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: BlocBuilder<ProductMasterBloc, StateProductMaster>(
              builder: (context, state) {
                if (state is StateErrorProductMaster) {
                  return const Center(child: Text("StateErrorProductMaster"));
                } else if (state is StateInitialProductMaster) {
                  return const Center(child: Text("StateInitialProductMaster"));
                } else if (state is StateLoadingProductMaster) {
                  return const Center(child: Text("StateLoadingProductMaster"));
                } else {
                  return const Center(child: Text("StateLoadedProductMaster"));
                }
              },
            ),
          ),
          SizedBox(
            height: 200,
            child: Center(
              child: InkResponse(
                onTap: () => BlocProvider.of<ProductMasterBloc>(context)
                    .add(EventRequestProductMaster()),
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                    ),
                    child: Center(
                      child: Text(
                        'Get Advice',
                        style: themeData.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
