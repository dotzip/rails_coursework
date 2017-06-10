save_form = ->
  if ($('#item_client_id').val() == "- Создание нового -")
    $('#item_client_id').remove()
    $('#item_client_attributes_id').remove()
  else if ($('#item_client_id').val() == '- Редактирование -')
    $('#item_client_id').remove()

insert_form = ->
  f = $("#client-fieldset").attr("data-content")
  if ($("#item_client_id").val() == '')
    $("#client-fields").html('Без клиента')
  else if ($('#item_client_id').val() == '- Создание нового -')
    $("#client-fields").html(f)
  else if ($('#item_client_id').val() == '- Редактирование -')
    $("#client-fields").html(f)
  else
    $("#client-fields").html('Выбран существующий клиент')

ready = ->
  insert_form()
  $("#item_client_id").change -> insert_form()
  $('#save').on 'click', save_form

$(document).ready ready
$(document).on 'page:load', ready