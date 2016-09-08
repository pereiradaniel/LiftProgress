@Lift = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/lifts/#{ @props.lift.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteLift @props.lift
  handleEdit: (e) ->
    e.preventDefault()
    data =
      date: React.findDOMNode(@refs.date).value
      liftname: React.findDOMNode(@refs.liftname).value
      weightlifted: React.findDOMNode(@refs.weightlifted).value
      ismetric: React.findDOMNode(@refs.ismetric).value
      repsperformed: React.findDOMNode(@refs.repsperformed).value
      onerm: React.findDOMNode(@refs.onerm).value
    $.ajax
      method: 'PUT'
      url: "/lifts/#{ @props.lift.id }"
      dataType: 'JSON'
      data:
        lift: data
      success: (data) =>
        @setState edit: false
        @props.handleEditLift @props.lift, data
  liftRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.lift.date
      React.DOM.td null, @props.lift.liftname
      React.DOM.td null, @props.lift.weightlifted
      React.DOM.td null, @props.lift.ismetric.toString()
      React.DOM.td null, @props.lift.repsperformed
      React.DOM.td null, @props.lift.onerm
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-primary'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  liftForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'date'
          defaultValue: @props.lift.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.lift.liftname
          ref: 'liftname'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.lift.weightlifted
          ref: 'weightlifted'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'boolean'
          defaultValue: @props.lift.ismetric
          ref: 'ismetric'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.lift.repsperformed
          ref: 'repsperformed'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.lift.onerm
          ref: 'onerm'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @liftForm()
    else
      @liftRow()
