angular.module("customer").factory "Cart", ($http, ShowError) ->
  Model = {}

  cart = null
  fetchInProgress = null
  Model.fetch = ()->
    if cart then return new Promise (resolve, reject) -> resolve(cart)
    if fetchInProgress then return fetchInProgress

    fetchInProgress = $http.get("/cart.json").then ({data: { cart: newCart }})->
      # in case we set it via updateLocal while the fetch was in progress
      if cart then return cart

      cart = newCart
      return cart
    , ShowError

  Model.updateLocal = (newCart)->
    if cart
      _.assign cart, newCart
    else
      cart = newCart

  Model.addItem = ({ id, questions, quantity })->
    $http.post("/cart/add_item/#{id}.json", { questions, quantity })

  Model.submitPayment = ({ token })->
    $http.post("/cart/submit_payment.json", { token })

  Model
