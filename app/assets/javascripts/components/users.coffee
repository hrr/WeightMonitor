@Users = React.createClass
  getInitialState: ->
    users: @props.data
  getDefaultProps: ->
    users: []
  diff: (jias, chloes) ->
    diffWeight = jias - chloes
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        className: 'name'
        'Weight Monitor'
      React.DOM.div
        className: 'row'
      React.createElement AmountBox, type: 'success', content: @state.users[0].weights[0].entry, text: "#{@state.users[0].name}'s Current"
      React.createElement AmountBox, type: 'info', content: @diff(@state.users[0].weights[0].entry, @state.users[1].weights[0].entry), text: 'Difference'
      React.createElement AmountBox, type: 'danger', content: @state.users[1].weights[0].entry, text: "#{@state.users[1].name}'s Current"
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Email'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for user in @state.users
            React.createElement User, key: user.id, user: user