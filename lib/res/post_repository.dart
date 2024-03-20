

import 'dart:convert';

import 'package:blocs/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostRepository{

  Future<List<PostsModel>> fetchposts()async{
    
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body) as List;
      return data.map((e) => PostsModel(
        id : e['id'],
        title : e['title'],
        body : e['body']
      )).toList();
    }
    }finally{
      
    }
    throw  Exception("Failed to load post");
  }
}