import 'package:bloc/bloc.dart';
import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/foundation.dart';



part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
}
