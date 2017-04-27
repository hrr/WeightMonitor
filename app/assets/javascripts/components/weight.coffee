@Weight = React.createClass
  getInitialState: ->
    edit: false
  render: ->
    React.DOM.tr null,
      React.DOM.td null, moment(@props.weight.registered).format("YYYY-MM-DD HH:mm")
      React.DOM.td null, @props.weight.entry
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Delete'
