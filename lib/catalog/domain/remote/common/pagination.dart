
class Pagination {
  bool? hasMore;
  int? currentPage;
  int? nextPage;
  int? prevPage;
  int? lastPage;
  int? totalRecords;

  Pagination(
      {this.hasMore,
        this.currentPage,
        this.nextPage,
        this.prevPage,
        this.lastPage,
        this.totalRecords});

  Pagination.fromJson(Map<String, dynamic> json) {
    hasMore = json['has_more'];
    currentPage = json['current_page'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
    lastPage = json['last_page'];
    totalRecords = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['has_more'] = hasMore;
    data['current_page'] = currentPage;
    data['next_page'] = nextPage;
    data['prev_page'] = prevPage;
    data['last_page'] = lastPage;
    data['total'] = totalRecords;
    return data;
  }
}