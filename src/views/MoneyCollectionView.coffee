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
    that =@
    @$nodes = @moneyViews.map (moneyView) ->
      randomX = Math.random()*window.innerWidth
      randomY = Math.random()*window.innerHeight
      newTotal = Math.random()*400-200
      proportion = Math.random()
      newX = newTotal*proportion
      newY = (newTotal-newX)*Math.sign(Math.random()-0.5)
      node = moneyView.$el.find('.coin')
      node.css('left':randomX,'top':randomY)
      node.animate('top': 800+newX, 'left': 800+newY,1000)
      that.$el.append (node)
    
    # append the array of elements to the moneyCollectionView DOM node
    #set random start points and end points and jquery transtion
    # in case we want to chain
    return @


# taken from http://www.ollysco.de/2012/04/gaussian-normal-functions-in-javascript.html




