import 'package:bookly_with_clean_arch/Features/search/presentation/manger/cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchFormTextField extends StatefulWidget {
  const CustomSearchFormTextField({super.key});

  @override
  State<CustomSearchFormTextField> createState() =>
      _CustomSearchFormTextFieldState();
}

class _CustomSearchFormTextFieldState extends State<CustomSearchFormTextField> {
  final textController = TextEditingController();
  var autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  String text = '';
  bool isLoading = false;

  void _performSearch(String searchText) {
    context.read<SearchBooksCubit>().fetchSearchBooks(
          subject: searchText,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        textInputAction: TextInputAction.search,
        controller: textController,
        onFieldSubmitted: _performSearch,
        onChanged: (value) {
          text = value;
        },
        onSaved: (newValue) {
          text = newValue!;
        },
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildFocusedOutlinedInputBorder(),
          hintText: 'Search',
          suffixIcon: BlocBuilder<SearchBooksCubit, SearchBooksState>(
            builder: (context, state) {
              isLoading == state is SearchBooksLoading ? true : false;
              return IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<SearchBooksCubit>().fetchSearchBooks(
                          subject: text,
                        );
                  } else {
                    autovalidateMode = true as AutovalidateMode;
                  }
                },
                icon: const Opacity(
                  opacity: .8,
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildFocusedOutlinedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 3,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
