@User = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.user.name
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          href: "/users/#{@props.user.id}"
          'View History'