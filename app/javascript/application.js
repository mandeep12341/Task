// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import '@nathanvda/cocoon';

require("jquery")
require("@nathanvda/cocoon")

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide(); }
    
    function add_fields(link, association, content) { var new_id = new Date().getTime(); var regexp = new RegExp("new_" + association, "g"); $(link).parent().before(content.replace(regexp, new_id)); }