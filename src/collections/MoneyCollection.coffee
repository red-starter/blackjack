class window.MoneyCollection extends Backbone.Collection
  model: Money

  initialize: (params) =>
    @moneys = params.numberOfMoneys
    @populate()

  populate: =>
    @reset()
    if (@moneys > 0) then @add(new Money(value:1)) for i in [0...@moneys] 

    