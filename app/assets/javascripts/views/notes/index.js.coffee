class Nodetree.Views.NotesIndex extends Backbone.View

  template: JST['notes/index']

  initialize: =>
    Backbone.gevents.on('note_click', @show)
    Backbone.gevents.on('note_click', @toggleNode)
    @model.on('change', @render)

  show: (note) =>
    @model.set(note.attributes)

  render: =>
    $(@.el).html(@template(model: @model))

  toggleNode: =>
    console.log('toggle node')
