# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model

  defaults:
    points:10
    betSize:1

  initialize: ->
    @makeGame()

  updatePoints: ->
    if @get('game').get('winner') == 'player' then @set('points',@get('points')+@get('betSize')) else @set('points',@get('points')-@get('betSize'))
    
    
    # ????
  makeGame: ->
    @set 'game', game = new Game(@attributes)
    # set the amount of money to be equal to number of moneys won
    @get('game').on 'change:winner', => @updatePoints()
    @set 'moneyHeap', moneyHeap = new MoneyCollection( 'numberOfMoneys':@get('points') )