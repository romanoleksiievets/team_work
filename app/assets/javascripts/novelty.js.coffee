jQuery ->
  $('.best_in_place').best_in_place();

  $('.best_in_place').bind "ajax:success", (e,data,status) ->
    c = JSON.parse(data)
    $(".ch_width select option[value='#{c.id}']").html("<option value='#{c.id}'>#{c.name}</option>")
