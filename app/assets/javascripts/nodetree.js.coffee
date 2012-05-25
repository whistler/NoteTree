window.Nodetree =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    notes_router = new Nodetree.Routers.Notes()

$(document).ready ->
  Nodetree.init()
