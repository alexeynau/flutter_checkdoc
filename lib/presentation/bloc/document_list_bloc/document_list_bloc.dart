import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'document_list_event.dart';
part 'document_list_state.dart';

class DocumentListBloc extends Bloc<DocumentListEvent, DocumentListState> {
  DocumentListBloc() : super(DocumentListInitial()) {
    on<FetchDocumentEvent>((event, emit) async {
      emit(DocumentListLoading());

      try {
        // Perform the logic here
        // You can use services or APIs to fetch data
        // Simulating a delay for demonstration purposes
        await Future.delayed(const Duration(seconds: 2));

        // If fetching data is successful, yield DocumentListLoaded with the data
        emit(DocumentListLoaded(["Document 1", "Document 2", "Document 3"]));
      } catch (error) {
        // If login fails, yield LoginFailure with the error message
        emit(DocumentListError( error.toString()));
      }
    });
  }
}
