Map<String, dynamic> parameterQueryHelper (String? search, int? page, int? limit, bool? over5) {

  switch((search == null, page == null, limit == null, limit == null)) {

    case (false, false, false, false) :
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (false, false, false, true) :
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
      };
    
    case (false, false, true, true) :
      return {
        'search': search,
        'page': page.toString(),
      };
    
    case (false, true, true, true) :
      return {
        'search': search,
      };
    
    case (true, true, true, true) :
      return {};

    case (true, true, true, false) :
      return {
        'over_5': over5
      };
    
    case (true, true, false, false) :
      return {
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (true, false, false, false) :
      return {
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
        
    case (true, true, false, true):
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (true, false, true, true):
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (true, false, true, false):
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (true, false, false, true):
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (false, true, true, false):
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (false, true, false, true):
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (false, true, false, false):
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
    
    case (false, false, true, false):
      return {
        'search': search,
        'page': page.toString(),
        'limit': limit.toString(),
        'over_5': over5
      };
  }
}