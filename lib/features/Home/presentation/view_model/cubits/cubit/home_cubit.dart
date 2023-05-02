import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/core/collection_endpoint.dart';
import 'package:social_app/features/Auth/data/models/userModel.dart';
import 'package:social_app/features/Home/presentation/views/chatsView.dart';
import 'package:social_app/features/Home/presentation/views/feedsView.dart';
import 'package:social_app/features/Home/presentation/views/notificationsView.dart';
import 'package:social_app/features/Home/presentation/views/settingsView.dart';
import 'package:social_app/features/Home/presentation/views/usersView.dart';

import '../../../../../../core/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


}
