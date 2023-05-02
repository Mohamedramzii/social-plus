import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/Auth/presentation/view_model/Cubits/auth/auth_cubit.dart';
import 'package:social_app/features/Home/presentation/view_model/cubits/cubit/home_cubit.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit= BlocProvider.of<AuthCubit>(context);
         if(state is GetUserDataSuccessState){
           return Column(
              children: [
                Center(
                  child: Text(cubit.userModel!.firstname!),
                ),
              ],
            );
         }else{
           return const Center(child: CircularProgressIndicator());
         }
        },
      ),
    );
  }
}
