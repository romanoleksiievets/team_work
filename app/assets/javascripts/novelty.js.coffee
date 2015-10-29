jQuery ->
  $('.best_in_place').best_in_place();

  $('.best_in_place').bind "ajax:success", (e,data,status) ->
    c = JSON.parse(data)
    $(".ch_width select option[value='#{c.id}']").html("#{c.name}")
    $(".#{c.id}").css("background-color", "#{c.color}")