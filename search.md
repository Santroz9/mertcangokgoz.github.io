---
layout: default
---

<form action="get" id="site_search">
  <label for="search_box">Arama Alanımız:</label><input type="text" id="search_box">
  <input type="submit" value="Arama YAP!">
</form>

<ul id="search_results"></ul>


<script src="/assets/js/lunr.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/assets/js/search.js"></script>
