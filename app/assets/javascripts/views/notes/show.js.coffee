class Nodetree.Views.NotesShow extends Backbone.View
  tagname: 'div'
  template: JST['notes/show']

render: ->
  $(@.el).html(@template(@model))