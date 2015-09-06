class window.MoneyView extends Backbone.View
  # has access to money model

  className: 'money'
  
  # change this to money image gif
  template: _.template('<img class="coin" src=img/<%=image%>.png>')

  # events hash
  events :
    'click':'action'

  initialize: ->
    # do stuff
    # maybe add listener
    @render()

  render: ->
    # set html of node equal to the template
    if Math.floor(Math.random()*2) then image = 'dollar' else image = 'coin'
    @$el.html(@template(image:image))

  # controller
  action: ->
    # get position and explode
    @$el.hide()
  # @model.do something 
# takem from http://www.ollysco.de/2012/04/gaussian-normal-functions-in-javascript.html
`
/**
  * Returns a Gaussian Random Number around a normal distribution defined by the mean
  * and standard deviation parameters.
  *
  * Uses the algorithm used in Java's random class, which in turn comes from
  * Donald Knuth's implementation of the Box–Muller transform.
  *
  * @param {Number} [mean = 0.0] The mean value, default 0.0
  * @param {Number} [standardDeviation = 1.0] The standard deviation, default 1.0
  * @return {Number} A random number
  */
 Math.randomGaussian = function(mean, standardDeviation) {
 
     mean = defaultTo(mean, 0.0);
     standardDeviation = defaultTo(standardDeviation, 1.0);
 
     if (Math.randomGaussian.nextGaussian !== undefined) {
         var nextGaussian = Math.randomGaussian.nextGaussian;
         delete Math.randomGaussian.nextGaussian;
         return (nextGaussian * standardDeviation) + mean;
     } else {
         var v1, v2, s, multiplier;
         do {
             v1 = 2 * Math.random() - 1; // between -1 and 1
             v2 = 2 * Math.random() - 1; // between -1 and 1
             s = v1 * v1 + v2 * v2;
         } while (s >= 1 || s == 0);
         multiplier = Math.sqrt(-2 * Math.log(s) / s);
         Math.randomGaussian.nextGaussian = v2 * multiplier;
         return (v1 * multiplier * standardDeviation) + mean;
     }
 
 };
`