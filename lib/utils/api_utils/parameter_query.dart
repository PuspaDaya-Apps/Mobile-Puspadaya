Map<String, dynamic> parameterQueryHelper (String? search, int? page, int? limit) {

  switch((search == null, page == null, limit == null)) {

    case (false, false, false) :
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
      };
    
    case (false, false, true) :
      return {
        'search': search,
        'page': page.toString(),
      };
    
    case (false, true, true) :
      return {
        'search': search,
      };
    
    case (true, true, true):
      return {};
    
    case (true, true, false):
      return {
        'limit': limit.toString(),
      };
    
    case (true, false, true):
     return {
        'page': page.toString(),
      };
    
    case (true, false, false):
      return {
        'page': page.toString(),
        'limit': limit.toString(),
      };
    
    case (false, true, false):
      return {
        'search': search,
        'limit': limit.toString(),
      };
  }
}