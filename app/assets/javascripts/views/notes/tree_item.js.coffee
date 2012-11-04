class Nodetree.Views.TreeItem extends Backbone.View

  template: JST['notes/tree']

  events:
    'click':'show_note'
    
  initialize: =>

  show_note: =>
    Backbone.gevents.trigger('note_click', @model)

  render: =>
    $(@.el).html(@template(note: @model))
    this
