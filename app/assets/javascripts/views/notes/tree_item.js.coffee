class Nodetree.Views.TreeItem extends Backbone.View

  template: JST['notes/tree']

  events:
    'click':'show_note'
    
  initialize: =>

  show_note: =>
    Backbone.gevents.trigger('show_note', @model)
    console.log("trigger show note")

  render: =>
    $(@.el).html(@template(note: @model))
    this
