import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:project_tani/core/helper/helper.dart';
import 'package:project_tani/core/utils/shared_value.dart';
import 'package:project_tani/core/utils/widgets/custom_button.dart';
import 'package:project_tani/core/utils/widgets/custom_text_form_field.dart';
import 'package:project_tani/feature/comodity/data/models/comodity_model.dart';
import 'package:project_tani/feature/comodity/presentation/bloc/comodity_bloc.dart';
import 'package:project_tani/feature/comodity/presentation/ui/comodity.dart';
import 'package:project_tani/feature/comodity/presentation/widgets/drop_down_grade.dart';
import 'package:project_tani/feature/comodity/presentation/widgets/mini_button.dart';

class DetailComodity extends StatefulWidget {
  ComodityModel? comodity;
  String? token;
  DetailComodity({Key? key, this.comodity, this.token}) : super(key: key);

  @override
  State<DetailComodity> createState() => _DetailComodityState();
}

class _DetailComodityState extends State<DetailComodity> {
  TextEditingController blossomTreeDateController = TextEditingController();
  TextEditingController harvestingDateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String dropDownValue = 'A';

  @override
  void initState() {
    blossomTreeDateController =
        TextEditingController(text: widget.comodity?.blossomTreedate ?? '-');
    harvestingDateController =
        TextEditingController(text: widget.comodity?.harvestingDate ?? '-');
    weightController =
        TextEditingController(text: widget.comodity?.weight?.toString() ?? '-');
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
                                  child: const Icon(Icons.arrow_back),
                                ),
                                Center(
                                  child: Text(
                                    'Detail Komoditas',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            color:
                                                CustomColors.colorsFontPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 66,
                                  height: 66,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/Ellipse 9.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 42.0),
                                  child: SizedBox(
                                    height: 66,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.comodity?.farmer?.name ??
                                              'Anonim',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  color: CustomColors
                                                      .colorsFontPrimary,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 14,
                                              height: 14,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/catat_komoditas_buah.png'),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              child: Text(
                                                widget.comodity?.fruit?.name ??
                                                    '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2!
                                                    .copyWith(
                                                        color: CustomColors
                                                            .primary,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 28.0),
                            child: Divider(
                              thickness: 1,
                              color: CustomColors.borderField,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tanggal Pohon Berbunga',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                      isDateField: true,
                                      controller: blossomTreeDateController,
                                      hintext: 'Masukan tanggal berbunga',
                                      validator: (value) {
                                        if (value!.trim().isEmpty) {
                                          return 'Tolong Masukan tanggal berbunga';
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tanggal Panen',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                      isDateField: true,
                                      controller: harvestingDateController,
                                      hintext: 'Masukan tanggal berbunga',
                                      validator: (value) {
                                        if (value!.trim().isEmpty) {
                                          return 'Tolong Masukan tanggal berbunga';
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Grade Buah',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: DropDownGrade(
                                    dropDownValue: dropDownValue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Berat Hasil Panen',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                      isNumber: true,
                                      controller: weightController,
                                      hintext: 'Masukan Berat Hasil Panen',
                                      validator: (value) {
                                        if (value!.trim().isEmpty) {
                                          return 'Tolong Masukan Berat Hasil Panen';
                                        } else {
                                          return null;
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: MiniButton(text: 'Hapus'),
                          ),
                          BlocConsumer<ComodityBloc, ComodityState>(
                            listener: (context, state) {
                              if (state is ComodityDataError) {
                                showSimpleNotification(
                                    Text(state.message ?? 'terjadi kesalahan'),
                                    background: CustomColors.dangerColor);
                              } else if (state is UpdateComoditySucces ||
                                  state is VerifyComoditySucces) {
                                showSimpleNotification(
                                    const Text("Sukses Update Data Komoditas"),
                                    background: CustomColors.primary);
                                Helper.navigatorPushAndReplacement(
                                  context,
                                  ComodityPage(
                                    token: widget.token,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is ComodityLoading) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 48.0),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                          color: CustomColors.primary)),
                                );
                              } else {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 48),
                                      child: CustomButton(
                                        'Simpan',
                                        color: Colors.white,
                                        fontColor: CustomColors.buttonColor,
                                        onTap: () {
                                          BlocProvider.of<ComodityBloc>(context)
                                              .add(
                                            UpdateComodityEvent(
                                              token: widget.token,
                                              id: widget.comodity!.id,
                                              blossomTreeDate:
                                                  blossomTreeDateController
                                                      .text,
                                              harvestingDate:
                                                  harvestingDateController.text,
                                              fruitGrade: dropDownValue,
                                              weight: int.parse(
                                                  weightController.text),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: CustomButton(
                                        'Validasi',
                                        color: CustomColors.buttonColor,
                                        onTap: () {
                                          BlocProvider.of<ComodityBloc>(context)
                                              .add(
                                            VerifyComodityEvent(
                                              token: widget.token,
                                              id: widget.comodity!.id,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 33),
                            child: Text(
                              'Jika catatan telah di validasi, maka data tidak dapat dirubah.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.dangerColor),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ])))));
  }
}
