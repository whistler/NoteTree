class Nodetree.Views.NoteTree extends Backbone.View

  initialize: ->
    @collection.on('reset', @render)
    @collection.on('add', @addOne)
    @collection.fetch()

  addOne: (node) =>
    tree_item = new Nodetree.Views.TreeItem(model: node)
    $(@.el).append(tree_item.render().el)

  addAll: =>
    @collection.forEach(@addOne)

  render: =>
    @addAll()
