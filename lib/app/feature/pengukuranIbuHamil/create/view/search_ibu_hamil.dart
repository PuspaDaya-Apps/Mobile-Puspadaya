import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/create/model/ibu_hamil_search.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class SearchIbuHamil extends StatelessWidget {
  const SearchIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchIbuHamilView();
  }
}

class SearchIbuHamilView extends StatefulWidget {
  const SearchIbuHamilView({super.key});

  @override
  State<SearchIbuHamilView> createState() => _SearchIbuHamilViewState();
}

class _SearchIbuHamilViewState extends State<SearchIbuHamilView> {
  TextEditingController _searchController = TextEditingController();
  // Placeholder values for the variables
  final List<IbuHamilSearch> ibuHamilList = [
    IbuHamilSearch(
      name: "Kurma Melati Ayu Putri",
      nik: "362155482327263",
    ),
    IbuHamilSearch(
      name: "Mentari Kumala Sari",
      nik: "362155482327263",
    ),
    IbuHamilSearch(
      name: "Dewi antasari",
      nik: "362155482327263",
    ),
    IbuHamilSearch(
      name: "Adianti Ayu Lestari",
      nik: "362155482327263",
    ),
    IbuHamilSearch(
      name: "Della Marisa ",
      nik: "362155482327263",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          child: TextField(
            controller: _searchController,
            style: Theme.of(context).textTheme.bodySmall,
            keyboardType: TextInputType.text,
            obscureText: false,
            decoration: InputDecoration(
              prefixIcon: Icon(
                FluentIcons.search_24_regular,
              ),
              hintText: 'Pilih Anak',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey),
              filled: true,
              fillColor: backgroundWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: bluePrimaryMain),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.red),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView.builder(
            itemCount: ibuHamilList.length,
            itemBuilder: (context, index) {
              IbuHamilSearch ibuHamil = ibuHamilList[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pop(context, ibuHamil);
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: bluePrimary50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            ibuHamil.name,
                            style: AppTextStyles.primaryTextMedium.copyWith(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "NIK : ",
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: ibuHamil.nik,
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: bluePrimary50,
                    ),
                  ),
                  Divider(
                    color: textPrimary10,
                    thickness: 1,
                    height: 1,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
