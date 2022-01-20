import 'package:bloc_class/app/home/search_cep_bloc.dart';
import 'package:bloc_class/app/home/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
      ),
      body: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'cep',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<SearchCepBloc>().add(textController.text);
              },
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SearchCepBloc, SearchCepState>(
              builder: (context, state) {
                if (state is SearchCepError) {
                  return Text(state.message,
                      style: const TextStyle(color: Colors.red));
                }

                if (state is SearchCepLoading) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }

                state = state as SearchCepSuccess;

                if (state.data.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Text(
                    'Cidade: ${state.data['localidade']}, ${state.data['uf']}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
