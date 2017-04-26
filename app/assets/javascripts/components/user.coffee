@User = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.user.name
      React.DOM.td null, @props.user.email
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'View History'