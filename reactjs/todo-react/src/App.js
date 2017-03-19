import React, { Component } from 'react';
import Task from './Task.js';

class App extends Component {

  // Constructor
  constructor(props) {
    super(props);
    this.state = { tasks: {} };
  }

  // Render
  render() {
    let taskItems = Object.keys(this.state.tasks).map(name => {
      return (
        <Task
          name={name}
          key={name}
          status={this.state.tasks[name]}
          ondelete={this.deleteTask.bind(this, name)}
        />
      );
    });
    return (
      <div className="app-wrapper">
        <div>
          <input type="text" placeholder="Task name" id="taskNameInput"/>
          <button className="standard-btn" onClick={this.addTask}>Add task</button>
        </div>
        <div className="tasks-list">{taskItems}</div>
      </div>
    );
  }

  // Delete a Task
  deleteTask(name) {
    let object = Object.assign({}, this.state.tasks);
    delete object[name];
    this.setState(prevState => ({
      tasks: object
    }));
  }

  // Add a new Task
  addTask = () => {
    let name = document.getElementById('taskNameInput').value;
    let alreadyExists = this.state.tasks[name];

    // Can create Task
    if (name.length >= 3 && !alreadyExists) {
      let object = Object.assign({}, this.state.tasks);
      object[name] = false;
      this.setState(prevState => ({
        tasks: object
      }));
    // Task name is too short
    } else if (name.length < 3) {
      alert("Task name must at least be 3 characters long");
    // Task already exists
    } else if (alreadyExists) {
      alert("A task with this name already exists")
    }
  }

  // When component mounts
  componentDidMount() {
    this.setState(prevState => ({
      tasks: JSON.parse(localStorage.getItem("tasklist"))
    }));
  }

  // When component updates
  componentDidUpdate() {
    localStorage.setItem("tasklist", JSON.stringify(this.state.tasks));
  }
}

export default App;
