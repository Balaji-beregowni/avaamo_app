// UserTableHTML.jsx
import React from 'react';

const UserTableHTML = ({ users, downloadCSV }) => (
  <table className="table table-striped">
    <thead className="thead-dark">
      <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Download</th>
      </tr>
    </thead>
    <tbody>
      {users.map(user => (
        <tr key={user.id}>
          <td>{user.username}</td>
          <td>{user.email}</td>
          <td>
            <button className="btn btn-primary" onClick={() => downloadCSV(user.id)}>Download CSV</button>
          </td>
        </tr>
      ))}
    </tbody>
  </table>
);

export default UserTableHTML;

