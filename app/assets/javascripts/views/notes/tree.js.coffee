class Nodetree.Views.NotesTree extends Backbone.View

  template: JST['notes/tree']

  initialize: ->
    @note_list = new Nodetree.Collections.Notes()
    @note_list.on('reset', @render)
    @note_list.fetch()
    

  render: =>
    $(@.el).html(@template(note_list: @note_list))