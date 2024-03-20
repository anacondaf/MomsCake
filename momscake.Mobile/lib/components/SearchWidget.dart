import 'package:flutter/material.dart';

import '../app_styles.dart';


class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                offset: Offset(1, 5),
                spreadRadius: 1,
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.search,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "What you wish for?",
                      border: InputBorder.none,
                      hintStyle: AppStyles.b3,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.filter_list,
                  color: AppStyles.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
