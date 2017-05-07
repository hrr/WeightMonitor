@Users = React.createClass
  getInitialState: ->
    users: @props.data
  getDefaultProps: ->
    users: []
  diff: (jias, chloes, jiasTarget, chloesTarget) ->
    if Math.abs(jias - jiasTarget) > Math.abs(chloes - chloesTarget)
      "Chloe is leading with #{Math.abs(chloes - chloesTarget).toFixed(1)}kg from her target weight."
    else if Math.abs(jias - jiasTarget) < Math.abs(chloes - chloesTarget)
      "Jias is leading with #{Math.abs(jias - jiasTarget).toFixed(1)}kg from his target weight."
    else if jias == jiasTarget && chloes == chloesTarget
      "Good job! Both are at the their target weights."
    else
      "Both are equally close to their target weight."
  diffType: (jias, chloes, jiasTarget, chloesTarget, uId) ->
    if (Math.abs(jias - jiasTarget) > Math.abs(chloes - chloesTarget) && uId == 1) ||
       (Math.abs(jias - jiasTarget) < Math.abs(chloes - chloesTarget) && uId == 2)
      "danger"
    else
      "success"
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        className: 'name'
        'Weight Monitor'
      React.DOM.div
        className: 'row'
      React.createElement AmountBox, type: @diffType(@state.users[0].weights[0].entry, @state.users[1].weights[0].entry, @state.users[0].targetWeight, @state.users[1].targetWeight, 1), content: @state.users[0].weights[0].entry + "kg" + " (" + (@state.users[0].weights[0].entry - @state.users[0].targetWeight).toFixed(1)+ "kg off target)", text: "#{@state.users[0].name} (target: #{@state.users[0].targetWeight}kg)"
      React.createElement AmountBox, type: 'info', content: @diff(@state.users[0].weights[0].entry, @state.users[1].weights[0].entry, @state.users[0].targetWeight, @state.users[1].targetWeight), text: 'Leader'
      React.createElement AmountBox, type: @diffType(@state.users[0].weights[0].entry, @state.users[1].weights[0].entry, @state.users[0].targetWeight, @state.users[1].targetWeight, 2), content: @state.users[1].weights[0].entry + "kg" + " (" + (@state.users[1].weights[0].entry - @state.users[1].targetWeight).toFixed(1)+ "kg off target)", text: "#{@state.users[1].name} (target: #{@state.users[1].targetWeight}kg)"
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Action'
        React.DOM.tbody null,
          for user in @state.users
            React.createElement User, key: user.id, user: user