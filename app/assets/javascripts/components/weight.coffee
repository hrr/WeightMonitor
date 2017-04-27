@Weight = React.createClass
  getInitialState: ->
    edit: false
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.weight.created_at
      React.DOM.td null, @props.weight.entry
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
