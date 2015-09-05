class window.MoneyCollectionView extends Backbone.View

  # we have access to MoneyCollection which was passed in 

  className: 'moneyCollection'


  # when money is added the view should be rendered again
  initialize: ->
    # add method on collection bubbles up update event
    @collection.populate()
    @collection.on 'update', => @render()
    @render()

  render: ->


    # clear current html
    @$el.empty
    

    # create an array of MoneyViews from our collection
    # collection is undefined
    @moneyViews = @collection.models.map (model)->
      return new MoneyView('model' : model)
    

    # loop over the array of the money views and extract their DOM nodes
    @$nodes = @moneyViews.map (moneyView) ->
      return moneyView.$el

    # append the array of elements to the moneyCollectionView DOM node
    @$el.append (@$nodes)
    # in case we want to chain
    return @






