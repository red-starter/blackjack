class window.MoneyView extends Backbone.View
  # has access to money model

  className: 'money'
  
  # change this to money image gif
  template: _.template('<div>Money yo</div>')

  # events hash
  events :
    'click':'action'

  initialize: ->
    # do stuff
    # maybe add listener
    @render()

  render: ->
    # set html of node equal to the template 
    @$el.html(@template(@model.attributes))

  # controller
  action: ->
    @$el.hide()
  # @model.do something 