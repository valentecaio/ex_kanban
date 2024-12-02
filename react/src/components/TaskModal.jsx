import '../styles/Card.css'
import React from 'react'
import * as queries from '../graphql/queries'
import { dateTimeToDate } from '../utils/date'
import { BeatLoader } from 'react-spinners'
import { useLazyQuery } from '@apollo/client'
import ReactModal from 'react-modal'
ReactModal.setAppElement('*'); // suppresses modal-related test warnings.

const TaskModal = ({ isOpen, task }) => {
  // lazyly load task data when modal is opened
  const query = queries.get_task()
  const [loadTask, { _loading, _error, data, called }] = useLazyQuery(query, {
    variables: { id: task.id }
  });
  if (isOpen && !called) {
    // modal just opened -> load task data
    loadTask()
  }
  if (data && data.getTask) {
    // finished loading data -> update task
    task = data.getTask;
  }

  return (
    <ReactModal isOpen={isOpen}>
      {
        data && data.getTask &&
        <div>
          <h2>{task.name}</h2>
          <p>{`Description: ${task.description}`}</p>
          <p>{`When: ${dateTimeToDate(task.executionDate)}`}</p>
          <p>{`Priority: ${task.priority}`}</p>
          <p>{`Attachments:`}</p>
          {task.attachments.map(a => (
            <div key={a.id}>
              <a href={a.url}>{`${a.url}\n`}</a>
              {/* <img src={a.url} alt={a.url} width="300px" /> */}
            </div>
          ))}
        </div>
        || <BeatLoader /> // show a spinner while loading
      }
    </ReactModal>
  );
}

export default TaskModal;
