class Nodetree.Views.NotesIndex extends Backbone.View

  template: JST['notes/index']

  initialize: =>
    Backbone.gevents.on('show_note', @show)
    @model.on('change', @render)

  show: (note) =>
    @model.set(note.attributes)

  render: =>
    $(@.el).html(@template(model: @model))
