import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import UserTable from './components/UserTable'; // Assuming UserTable component is located in 'src/components/UserTable.jsx'

const App = () => {
  return (
    <div>
      <UserTable users={[]} />
    </div>
  );
};

export default App;