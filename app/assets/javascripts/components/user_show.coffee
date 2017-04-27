@UserShow = React.createClass
  getInitialState: ->
    user: @props.data
    weights: @props.data.weights
  getDefaultProps: ->
    user: []
    weights: []
  addWeight: (weight) ->
    weights = React.addons.update(@state.weights, { $unshift: [weight] })
    @setState weights: weights
  deleteWeight: (weight) ->
    index = @state.weights.indexOf weight
    weights = React.addons.update(@state.weights, { $splice: [[index, 1]] })
    @replaceState weights: weights, user: @state.user
  updateWeight: (weight, data) ->
    index = @state.weights.indexOf weight
    weights = React.addons.update(@state.weights, { $splice: [[index, 1, data]] })
    @replaceState weights: weights, user: @state.user
  goBack: ->
    window.location.replace("/users")
  render: ->
    React.DOM.div
      className: 'user_show'
      React.DOM.h2
        className: 'name'
        "Weight Monitor (#{@state.user.name})"
      React.DOM.div
        className: 'row'
      React.createElement WeightForm, handleNewWeight: @addWeight, user: @state.user
      React.DOM.hr null
      React.DOM.button
        className: 'btn btn-default'
        onClick: @goBack
        '<-- Back'
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Weight'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for weight in @state.weights
            React.createElement Weight, key: weight.id, weight: weight, handleDeleteWeight: @deleteWeight, handleEditWeight: @updateWeight