import 'package:bloc_api/bloc/products_bloc.dart';
import 'package:bloc_api/bloc/request_state.dart';
import 'package:bloc_api/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/request_event.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: BlocProvider(
        create: (_) => ProductsBloc()..add(FetchProductEvent()),
        child: ProductsPage(),
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<ProductsBloc, RequestState>(builder: (context, state) {
      switch (state.status) {
        case RequestStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case RequestStatus.error:
          return const Center(child: Text('failed to fetch posts'));
        case RequestStatus.success:
          List<Product> pros = state.productModel.products;
          return pros.isEmpty
              ? const Center(child: Text('no products'))
              : ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Product product = pros[index];
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.rating.toString()),
                      trailing: Text(
                        product.price.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  },
                  itemCount: pros.length);
      }
    }));
  }
}
