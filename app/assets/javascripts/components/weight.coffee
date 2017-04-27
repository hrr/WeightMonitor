@Weight = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    # yeah... jQuery doesn't have a $.delete shortcut method
    $.ajax
      method: 'DELETE'
      url: "/weights/#{ @props.weight.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteWeight @props.weight
  handleEdit: (e) ->
    e.preventDefault()
    data =
      entry: ReactDOM.findDOMNode(@refs.entry).value
      date: ReactDOM.findDOMNode(@refs.date).value
      time: ReactDOM.findDOMNode(@refs.time).value
    # jQuery doesn't have a $.put shortcut method either
    $.ajax
      method: 'PUT'
      url: "/weights/#{ @props.weight.id }"
      dataType: 'JSON'
      data:
        weight: data
      success: (data) =>
        @setState edit: false
        @props.handleEditWeight @props.weight, data
  render: ->
    if @state.edit
      @userForm()
    else
      @userRow()
  userRow: ->
    React.DOM.tr null,
      React.DOM.td null, moment.utc(@props.weight.registered).format("YYYY-MM-DD HH:mm")
      React.DOM.td null, @props.weight.entry
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  userForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          type: 'date'
          className: 'form-control'
          placeholder: 'Date'
          name: 'date'
          defaultValue: moment.utc(@props.weight.registered).format("YYYY-MM-DD")
          ref: 'date'
        React.DOM.input
          type: 'time'
          className: 'form-control'
          placeholder: 'Time'
          name: 'time'
          defaultValue: moment.utc(@props.weight.registered).format("HH:mm")
          ref: 'time'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.weight.entry
          ref: 'entry'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'