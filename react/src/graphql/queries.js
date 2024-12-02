import { gql } from '@apollo/client'

function get_tasks() {
  return gql`
    query ListTasks {
      listTasks {
        id
        name
        description
        location
        executionDate
        priority
      }
    }`;
}

function get_tasks_with_filters() {
  return gql`
    query ListTasks($search: String, $location: String, $priority: String, $executionDate: DateTime) {
      listTasks(search: $search, location: $location, priority: $priority, executionDate: $executionDate) {
        id
        name
        description
        location
        executionDate
        priority
      }
    }`;
}

export { get_tasks, get_tasks_with_filters };