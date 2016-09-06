@Lift = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/lifts/#{ @props.lift.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteLift @props.lift
  render: ->
    React.DOM.tr null,
      React.DOM.tr null, @props.lift.data
      React.DOM.tr null, @props.lift.liftname
      React.DOM.tr null, @props.weightlifted
      React.DOM.tr null, @props.lift.ismetric.toString()
      React.DOM.td null, @props.lift.repsperformed
      React.DOM.td null, @props.lift.onrm
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
