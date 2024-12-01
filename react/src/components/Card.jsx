import '../styles/Card.css'
import React from 'react'

const Card = ({ task }) => {
  const date = new Date(task.executionDate).toLocaleString('en-UK')
  return (
    < div className='Card' >
      <h2>{task.name}</h2>
      <p>{date}</p>
      <p>{task.priority}</p>
    </div >
  );
}

export default Card;
