import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createPengukuranBalita/model/balita_search.dart';
import 'package:puspadaya/app/view/widget/appbar.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class SearchBalita extends StatelessWidget {
  const SearchBalita({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchBalitaView();
  }
}

class SearchBalitaView extends StatefulWidget {
  const SearchBalitaView({super.key});

  @override
  State<SearchBalitaView> createState() => _SearchBalitaViewState();
}

class _SearchBalitaViewState extends State<SearchBalitaView> {
  TextEditingController _searchController = TextEditingController();
  // Placeholder values for the variables
  final List<BalitaSearch> balitaList = [
    BalitaSearch(
      name: "Muhammad Kaivan Al Hakim",
      nik: "362155482327263",
      parent: "Sela Khusnanda",
    ),
    BalitaSearch(
      name: "Muhammad Ilham Azaka",
      nik: "362155482327263",
      parent: "Sela Khusnanda",
    ),
    BalitaSearch(
      name: "Muhammad Kelvin Aliya",
      nik: "362155482327263",
      parent: "Sela Khusnanda",
    ),
    BalitaSearch(
      name: "Muhammad Zein Akrobi",
      nik: "362155482327263",
      parent: "Sela Khusnanda",
    ),
    BalitaSearch(
      name: "Muhammad Amirul Aljabar",
      nik: "362155482327263",
      parent: "Sela Khusnanda",
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
            itemCount: balitaList.length,
            itemBuilder: (context, index) {
              BalitaSearch balita = balitaList[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pop(context, balita);
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
                            balita.name,
                            style: AppTextStyles.primaryTextMedium.copyWith(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "NIK : ",
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: balita.nik,
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 15, // Set a fixed height for the divider
                              width: 2,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Ibu : ",
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: balita.parent,
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
