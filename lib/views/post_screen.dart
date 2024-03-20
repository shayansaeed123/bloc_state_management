import 'package:blocs/bloc/api/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostsFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if(state.posts.isEmpty){
            return Center(child: CircularProgressIndicator());
          }else{
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
              return ListTile(
                title: Text('${state.posts[index].title}'),
                subtitle: Text(state.posts[index].body.toString()),
              );
            },);
          }
        },
      ),
    );
  }
}