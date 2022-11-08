import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/feature/comodity/domain/entity/comodity.dart';
import 'package:project_tani/feature/comodity/domain/entity/fruit.dart';
import 'package:project_tani/feature/comodity/presentation/bloc/comodity_bloc.dart';
import 'package:project_tani/feature/comodity/presentation/ui/detail_comodity.dart';
import 'package:project_tani/feature/comodity/presentation/widgets/comodity_widget.dart';

class ComodityPage extends StatefulWidget {
  String? token;
  ComodityPage({
    Key? key,
    this.token,
  }) : super(key: key);

  @override
  State<ComodityPage> createState() => _ComodityPageState();
}

class _ComodityPageState extends State<ComodityPage> {
  @override
  void initState() {
    BlocProvider.of<ComodityBloc>(context).add(
      GetListComodityEvent(
        token: widget.token,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Icon(Icons.arrow_back)),
                      Center(
                        child: Text(
                          'Komoditas Buah',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: CustomColors.colorsFontPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ComodityBloc, ComodityState>(
                  builder: (context, state) {
                    if (state is ComodityLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 48.0),
                        child: Center(
                            child: CircularProgressIndicator(
                                color: CustomColors.primary)),
                      );
                    } else if (state is GetListComoditySuccess) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 32.0),
                        child: ListView.builder(
                            itemCount: state.listComodity.length,
                            itemBuilder: (context, index) => ComodityWidget(
                                  image: 'assets/fruit.png',
                                  comodity: state.listComodity[index],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DetailComodity(
                                            comodity: state.listComodity[index],
                                            token: widget.token,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )),
                      );
                    } else if (state is ComodityEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 48.0),
                        child: Center(child: Text('daftar komoditas kosong')),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
