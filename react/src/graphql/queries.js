import { gql } from '@apollo/client'

// function get_tasks(search) {
//   return gql`
//     query {
//       listTasks(search: "${search}") {
//         id
//         name
//         description
//         executionDate
//         priority
//       }
//     }`;
// }

function get_tasks() {
  return gql`
    query ListTasks {
      listTasks {
        id
        name
        description
        executionDate
        priority
      }
    }`;
}

function get_tasks_with_filters() {
  return gql`
    query ListTasks($search: String, $address: String, $priority: String, $executionDate: DateTime) {
      listTasks(search: $search, address: $address, priority: $priority, executionDate: $executionDate) {
        id
        name
        description
        address
        executionDate
        priority
      }
    }`;
}

export { get_tasks, get_tasks_with_filters };