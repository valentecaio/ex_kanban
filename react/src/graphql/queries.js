import { gql } from '@apollo/client'

function get_tasks() {
  return gql`
    query ListTasks($search: String, $location: String, $priority: String, $executionDate: DateTime) {
      listTasks(search: $search, location: $location, priority: $priority, executionDate: $executionDate) {
        id
        name
        executionDate
        priority
      }
    }`;
}

function get_task() {
  return gql`
    query GetTask($id: ID!) {
      getTask(id: $id) {
        id
        name
        description
        location
        executionDate
        priority
        attachments {
          id
          url
        }
      }
    }`;
}

export { get_tasks, get_task };