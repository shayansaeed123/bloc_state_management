
 import 'package:blocs/models/post_model.dart';
import 'package:equatable/equatable.dart';
///Events
abstract class PostEvent extends Equatable{

  const PostEvent();

  List<Object?> get props => [];
}

class PostsFetch extends PostEvent{}
////States

class PostState extends Equatable {
  final bool isLoading;
  final List<PostsModel> posts;
  final String errorMessage; 

  const PostState({this.isLoading = false, this.posts =const<PostsModel> [], this.errorMessage = ''});

  PostState copyWith({bool? isLoading,List<PostsModel>? posts, String? errorMessage}){
    return PostState(isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage ?? this.errorMessage,
    posts: posts ?? this.posts
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, posts, errorMessage];

}

////Bloc

