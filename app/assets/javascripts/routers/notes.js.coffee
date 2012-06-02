class Nodetree.Routers.Notes extends Backbone.Router
  routes:
    '':'index',
    ':id':'show'
  
  initialize: ->
    Backbone.gevents = _.extend({}, Backbone.Events);
    @notes = new Nodetree.Collections.Notes()
    @notes.fetch()
    @note = new Nodetree.Models.Note()
    @index_view = new Nodetree.Views.NotesIndex(model: @note)
    @tree_view = new Nodetree.Views.NoteTree(collection: @notes)
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

