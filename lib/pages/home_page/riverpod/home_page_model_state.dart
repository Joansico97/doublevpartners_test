part of './home_page_state.dart';

class HomePageModelState {
  int? currentIndex;
  // List<PostModel>? postList;
  // bool? isDeleted;

  HomePageModelState({
    this.currentIndex,
  });

  HomePageModelState.fromJson(Map<String, dynamic> json) {
    // if (json['postList'] != null) {
    //   postList = <PostModel>[];
    //   json['postList'].forEach((value) {
    //     postList!.add(PostModel.fromJson(value));
    //   });
    // } else {
    //   postList = <PostModel>[];
    // }
    currentIndex = json['currentIndex'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentIndex'] = currentIndex;
    return data;
  }
}
