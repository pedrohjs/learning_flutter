import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/src/screens/home/home_controller.dart';
import 'package:pokedex/src/shared/widgets/text_field_widget.dart';
import 'package:pokedex/src/utils/colors_util.dart';

class HomeScreen extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.background,
      appBar: this._buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorsUtil.white,
      centerTitle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      title: Text(
        'Pokédex',
        style: TextStyle(
          color: ColorsUtil.darkGrey,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: SvgPicture.asset('assets/icons/ic_favorite_border.svg'),
        ),
      ],
      toolbarHeight: 140,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: TextFieldWidget(
            controller: _controller.txtSearch,
            hintText: 'Search Pokemon',
            prefixIcon: SvgPicture.asset('assets/icons/ic_search.svg'),
            textCapitalization: TextCapitalization.characters,
            onSubmitted: (text) {},
          ),
        ),
      ),
    );
  }
}
