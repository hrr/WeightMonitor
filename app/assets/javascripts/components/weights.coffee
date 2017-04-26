@Weights = React.createClass
  getInitialState: ->
    weights: @props.data
  getDefaultProps: ->
    weights: []
  render: ->
    React.DOM.table
      className: 'table table-bordered'
      React.DOM.thead null,
        React.DOM.tr null,
          React.DOM.th null, 'Date'
          React.DOM.th null, 'Weight'
          React.DOM.th null, 'Actions'
      React.DOM.tbody null,
        for weight in @state.weights
          React.DOM.tr key: weight.id,
            React.DOM.td null, new Date(weight.created_at).toISOString().split('T')[0]
            React.DOM.td null, "#{weight.entry} kg"
            React.DOM.td null,
              React.DOM.a
                className: 'btn btn-default'
                onClick: @handleToggle
                'Edit'
              React.DOM.a
                className: 'btn btn-danger'
                onClick: @handleDelete
                'Delete'