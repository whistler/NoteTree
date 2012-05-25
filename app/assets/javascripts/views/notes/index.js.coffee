class Nodetree.Views.NotesIndex extends Backbone.View

  template: JST['notes/index']

  initialize: ->

  render: ->
    $(@.el).html(@template)