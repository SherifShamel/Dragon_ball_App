import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_layout_switch/core/web_services.dart/web_services.dart';
import 'package:test_layout_switch/data/data_source/character_data_source.dart';
import 'package:test_layout_switch/data/data_source/character_data_source_imp.dart';
import 'package:test_layout_switch/data/repository_imp/character_repository_imp.dart';
import 'package:test_layout_switch/domain/repository/character_repository.dart';
import 'package:test_layout_switch/domain/use_cases/character_use_case.dart';
import 'package:test_layout_switch/presentation/features/single_character_feature/view_model/states.dart';

class CharacterViewModel extends Cubit<CharacterStates> {
  CharacterViewModel() : super(CharacterLoadingState());

  final WebServices _webServices = WebServices();

  late CharacterRepository characterRepository;
  late CharacterDataSource characterDataSource;
  late CharacterUseCase characterUseCase;

  Future<bool> getData(String id) async {
    emit(CharacterLoadingState());

    characterDataSource = CharacterDataSourceImp(dio: _webServices.freeDio);
    characterRepository =
        CharacterRepositoryImp(characterDataSource: characterDataSource);
    characterUseCase =
        CharacterUseCase(characterRepository: characterRepository);

    final result = await characterUseCase.execute(id);

    return result.fold(
      (fail) {
        emit(CharacterErrorState());
        return Future.value(false);
      },
      (data) {
        emit(CharacterSuccessState(transformationData: data));

        return Future.value(true);
      },
    );
  }
}
