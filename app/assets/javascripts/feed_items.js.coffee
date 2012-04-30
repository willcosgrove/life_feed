# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  feedItemTemplate = $('#feed-item-template').html()
  pusher = new Pusher("ccc489e8bc03dd9208a3")
  channel = pusher.subscribe("feed-updates")
  channel.bind("new-item", (data)->
    data["message"] = twttr.txt.autoLink(data["message"])
    $(Mustache.to_html(feedItemTemplate, data)).prependTo('#feed-items').hide().slideDown()
  )