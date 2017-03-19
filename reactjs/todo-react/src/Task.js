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
    // Update LocalStorage
    let json = JSON.parse(localStorage.getItem("tasklist"));
    if (!json) {
      json = {};
    }
    json[this.props.name] = !this.state.status;
    localStorage.setItem("tasklist", JSON.stringify(json));

    // Update state
    this.setState(prevState => ({
      status: !prevState.status
    }));
  }
}

export default Task;
