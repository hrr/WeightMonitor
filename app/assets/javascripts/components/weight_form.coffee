@WeightForm = React.createClass
  getInitialState: ->
    user: @props.data
  getDefaultProps: ->
    user: []
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        className: 'name'
        "Weight Monitor (#{@state.user.name})"
      React.DOM.div
        className: 'row'
      React.DOM.hr null