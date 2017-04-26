@Users = React.createClass
  getInitialState: ->
    users: @props.data
  getDefaultProps: ->
    users: []
  totalUsers: ->
    tUsers = @state.users
    tUsers.reduce ((prev, curr) ->
      prev + 1
    ), 0
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        className: 'name'
        'Weight Monitor'
      React.DOM.div
        className: 'row'
      React.createElement AmountBox, type: 'success', tUsers: @totalUsers(), text: 'Jias Current'
      React.createElement AmountBox, type: 'info', tUsers: @totalUsers(), text: 'Difference'
      React.createElement AmountBox, type: 'danger', tUsers: @totalUsers(), text: 'Chloes Current'
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