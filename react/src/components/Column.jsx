import '../styles/Column.css'
import React from 'react'
import Card from './Card'

const Column = ({ title, tasks }) => {
  return (
    <div className='Column'>
      <h1>{title}</h1>
      {tasks.map(task => (
        <Card key={task.id} task={task} />
      ))}
    </div>
  );
}

export default Column;
