// UserTable.jsx
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import UserTableHTML from './UserTableHTML';

const UserTable = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    axios.get('/api/users')
      .then(response => {
        setUsers(response.data);
      })
      .catch(error => {
        console.error('Error fetching user data:', error);
      });
  }, []);

  const downloadCSV = (userId) => {
    axios.post(`/api/users/${userId}/download_orders_csv`)
        .then(response => {
            const data = response.data;
            if (data.attachment_id) {
              checkStatus(data.attachment_id);
            } else {
              displayMessage('User does not have any orders to download');
            }
        })
        .catch(error => {
            console.error('Error downloading CSV:', error);
        });
  };

  const checkStatus = (attachment_id) => {
    getStatus(attachment_id)
        .then(statusResponse => {
          if (statusResponse.status === 'completed') {
            const filename = statusResponse.path.split('/').pop()
            const anchor = document.createElement('a');
            anchor.href = '/' + filename;
            anchor.setAttribute('download', filename);
            anchor.style.display = 'none';
            document.body.appendChild(anchor);
            anchor.click();
            document.body.removeChild(anchor);
          } else {
            console.log('Status is not completed. Retrying...');
            setTimeout(() => {
                checkStatus(attachment_id);
            }, 1000); // Retry after 1 second
          }
        })
        .catch(error => {
          console.error('Error getting status:', error);
    });
  };

  const getStatus = (attachment_id) => {
    return axios.get(`/api/attachments/${attachment_id}/csv_status`)
      .then(response => {
        return response.data;
      })
      .catch(error => {
        throw error; // Re-throw the error so that it can be caught by the calling function
      });
  };

  return <UserTableHTML users={users} downloadCSV={downloadCSV} />;
};

export default UserTable;
