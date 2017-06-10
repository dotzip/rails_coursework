save_form = ->
  if ($('#stack_room_id').val() == "- Создание нового -")
    $('#stack_room_id').remove()
    $('#stack_room_attributes_id').remove()
  else if ($('#stack_room_id').val() == '- Редактирование -')
    $('#stack_room_id').remove()

insert_form = ->
  f = $("#room-fieldset").attr("data-content")
  if ($("#stack_room_id").val() == '')
    $("#room-fields").html('Без помещения')
  else if ($('#stack_room_id').val() == '- Создание нового -')
    $("#room-fields").html(f)
  else if ($('#stack_room_id').val() == '- Редактирование -')
    $("#room-fields").html(f)
  else
    $("#room-fields").html('Выбрано существующее помещение')

ready = ->
  insert_form()
  $("#stack_room_id").change -> insert_form()
  $('#save').on 'click', save_form

$(document).ready ready
$(document).on 'page:load', ready