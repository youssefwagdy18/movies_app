import 'package:flutter/material.dart';
import 'package:movies_app/api_response/rated_api/ratedApiManager.dart';
import 'package:movies_app/api_response/top_section_api/topSectionApiManager.dart';
import 'package:movies_app/api_response/upcomming_api/upcommingApiManager.dart';
import 'package:movies_app/features/page_home_screen/popular_section.dart';
import 'package:movies_app/features/page_home_screen/rated_section.dart';
import 'package:movies_app/features/page_home_screen/upcomming_section.dart';


class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {



  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child: Column(
        children: [
          PopularSection(),
          UpcommingSection(),
          RatedSection()
        ],
      ),
    );
  }
}
