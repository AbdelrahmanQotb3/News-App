import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';

import '../../../../../Utilities/firestore_constants.dart';
import '../../../../../model/articleResponse.dart';
import '../../../../../model/sourcesResponse.dart';

class NewsLocalDataSourceImpl extends NewsLocalDataSource{
  @override
  Future<SourceResponse?> loadTabsList(String categoryID) async {
    CollectionReference tabsCollection =
    FirebaseFirestore.instance.collection(FireStoreConstants.tabsCollectionName);
    DocumentSnapshot documentSnapshot = await tabsCollection.doc(categoryID).get();
    Map json = documentSnapshot.data() as Map;
    return SourceResponse.fromJson(json);
  }

  @override
  Future<ArticleResponse?> loadTabDetails(String sourceID) async{
    return null ;

  }
  @override
  Future<void> saveTabsResponse(String categoryID , SourceResponse response) async {
    CollectionReference tabsCollection =
    FirebaseFirestore.instance.collection(FireStoreConstants.tabsCollectionName);
    tabsCollection.doc(categoryID).set(response.toJson());
  }

  @override
  Future<void> saveArticles(String sourceID , ArticleResponse response) async{


  }
}