class Nodetree.Routers.Notes extends Backbone.Router
  routes:
    '':'index',
    ':id':'show'
  
  initialize: ->
    @index_view = new Nodetree.Views.NotesIndex()
    @tree_view = new Nodetree.Views.NotesTree()
    Backbone.history.start({pushState: true})

  showTree: =>
    @tree_view.render()
    $("#tree").html(@tree_view.el)


  index: =>
    @index_view.render()
    $("#note").html(@index_view.el)
    @showTree()

  show: ->
    show_view = new Backbone.Views.NoteShow()

