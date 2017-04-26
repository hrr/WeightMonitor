@WeightForm = React.createClass
  getInitialState: ->
    user: @props.data
    id: ''
    entry: ''
  getDefaultProps: ->
    user: []
  valid: ->
    @state.entry
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { weight: @state }, (data) =>
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        className: 'name'
        "Weight Monitor (#{@state.user.name})"
      React.DOM.div
        className: 'row'
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Weight'
            name: 'entry'
            value: @state.entry
            onChange: @handleChange
          React.DOM.input
            type: 'date'
            className: 'form-control'
            placeholder: 'Date'
            name: 'date'
            value: @state.date
            onChange: @handleChange
          React.DOM.input
            type: 'hidden'
            className: 'form-control'
            name: 'id'
            value: @state.user.id
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create entry'