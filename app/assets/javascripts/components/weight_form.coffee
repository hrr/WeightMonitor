@WeightForm = React.createClass
  getInitialState: ->
    user_id: @props.user.id
    entry: @props.lastWeight
    date: moment().format('YYYY-MM-DD')
    time: moment().format('HH:mm')
  componentWillReceiveProps: (nextProps) ->
      @setState "entry": nextProps.lastWeight
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/weights', { weight: @state }, (data) =>
      @props.handleNewWeight data
      @setState @getInitialState()
    , 'JSON'
  valid: ->
    @state.entry
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Weight'
          name: 'entry'
          pattern: '[0-9]+([\.,][0-9])?'
          step: '0.1'
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
          type: 'time'
          className: 'form-control'
          placeholder: 'Time'
          name: 'time'
          value: @state.time
          onChange: @handleChange
        React.DOM.input
          type: 'hidden'
          className: 'form-control'
          name: 'user_id'
          value: @props.user.id
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create entry'