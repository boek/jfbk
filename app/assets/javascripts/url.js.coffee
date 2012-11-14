# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("input[type=button]").click ->
    submitForm(this)
  $("#back").click ->
    reset()
  $("input[type=text]").click ->
    $(this).focus().select()

submitForm = (t) ->
  $(t).addClass("submitting")
  $(".topBar").addClass("loading")
  $.ajax '/create',
    type: 'POST'
    data: {url: "http://google.com"}
    dataType: 'html'
    error: (jqXHR, textStatus, errorThrown) ->
      $(t).removeClass("submitting")
      $(".topBar").removeClass("loading")
    success: (data, textStatus, jqXHR) ->
      $("#short_url").val(data).click()
      $(t).removeClass("submitting")
      $(".topBar").removeClass("loading")
      $("#card").addClass("flipped")

reset = ->
  $("#url").val("http://").click();
  $("#card").removeClass("flipped")