class Nodetree.Routers.Notes extends Backbone.Router
  routes:
    '':'index',
    ':id':'show'
  
  initialize: ->
    @index_view = new Nodetree.Views.NotesIndex()
    Backbone.history.start({pushState: true})
  
  index: ->
    @index_view.render()
    alert(@index_view.el)
    $("body").html(@index_view.el)
    
  show: ->
    show_view = new Backbone.Views.NoteShow()