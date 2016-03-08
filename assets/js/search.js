jQuery(function() {
  window.idx = lunr(function () {
    this.field('id');
    this.field('title', { boost: 10 });
    this.field('author');
    this.field('category');
  });

  window.data = $.getJSON('/site.json');

  window.data.then(function(loaded_data){
    $.each(loaded_data, function(index, value){
      window.idx.add(
        $.extend({ "id": index }, value)
      );
    });
  });

  $("#site_search").submit(function(){
      event.preventDefault();
      var query = $("#search_box").val();
      var results = window.idx.search(query);
      display_search_results(results);
  });

  function display_search_results(results) {
    var $search_results = $("#search_results");
    window.data.then(function(loaded_data) {
      if (results.length) {
        $search_results.empty();
        results.forEach(function(result) {
          var item = loaded_data[result.ref];
          var appendString = '<li><a href="' + item.url + '">' + item.title + '</a></li>';
          $search_results.append(appendString);
        });
      } else {
        $search_results.html('<li>No results found</li>');
      }
    });
  }
});
