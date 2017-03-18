import React, { Component } from 'react';
import Task from './Task.js';

class App extends Component {

  // Constructor
  constructor(props) {
    super(props);
    this.state = { tasks: [] };
  }

  // Render
  render() {
    let taskItems = this.state.tasks.map(name => {
      return (
        <Task
          name={name}
          key={name}
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
    this.setState(prevState => ({
      tasks: prevState.tasks.filter(item => {
        return (item !== name);
      })
    }));
  }

  // Add a new Task
  addTask = () => {
    let name = document.getElementById('taskNameInput').value;
    let alreadyExists = this.state.tasks.includes(name);

    if (name.length >= 3 && !alreadyExists) {
      this.setState(prevState => ({
        tasks: prevState.tasks.concat([name])
      }));
    } else if (name.length < 3) {
      alert("Task name must at least be 3 characters long");
    } else if (alreadyExists) {
      alert("A task with this name already exist")
    }
  }
}

export default App;
