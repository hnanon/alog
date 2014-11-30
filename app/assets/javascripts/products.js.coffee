# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  loaded_product = $('#product_device_id :selected').text()
  devices = $('#product_device_id').html()
  $('#product_device_id').parent().hide()
  if loaded_product.length != 0
    manufacturer = $('#_manufacturer_id :selected').text()
    escaped_manufacturer = manufacturer.replace(/([ #;&,.+*~\':"!^$[\][ ][()=>|\/@])/g, '\\$1')
    options = $(devices).filter("optgroup[label='#{escaped_manufacturer}']").html()
    $('#product_device_id').html(options)
    $('#product_device_id').parent().show()
  $('#_manufacturer_id').change ->
    manufacturer = $('#_manufacturer_id :selected').text()
    escaped_manufacturer = manufacturer.replace(/([ #;&,.+*~\':"!^$[\][ ][()=>|\/@])/g, '\\$1')
    options = $(devices).filter("optgroup[label='#{escaped_manufacturer}']").html()
    if options
      $('#product_device_id').html(options)
      $('#product_device_id').parent().show()
    else
      $('#product_device_id').empty()
      $('#product_device_id').parent().hide()