import React, { Component } from 'react';

class Task extends Component {

  // Constructor
  constructor(props) {
    super(props);
    this.state = { status: props.status };
  }

  // Render
  render() {
    return (
      <div id={this.props.name} className={this.state.status ? 'todo-task task-done' : 'todo-task task-todo'}>
        <h1>{this.props.name}</h1>
        <button className="standard-btn" onClick={this.toggleStatus}>Toggle</button>
        <button onClick={this.props.ondelete}>⌫</button>
      </div>
    );
  }

  // Toggle Task status
  toggleStatus = () => {
    let status = this.state.status ? "false" : "true";
    this.setState(prevState => ({
      status: !prevState.status
    }));
  }
}

export default Task;
