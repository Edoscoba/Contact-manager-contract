// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ContactManager {

  struct Contact{
    string name;
    string phoneNumber;
    string email;
   }

   mapping(address => Contact[]) public contacts;

    event ContactAdded(address indexed owner, string name, string phoneNumber, string email);
    event ContactUpdated(address indexed owner, uint256 index, string name, string phoneNumber, string email);
    event ContactDeleted(address indexed owner, uint256 index);

    function createContact(string memory _name, string memory _phoneNumber, string memory _email) external{
      contacts[msg.sender].push(Contact(_name, _phoneNumber, _email));
      emit ContactAdded(msg.sender, _name, _phoneNumber, _email);
      
    }

    function editContract(uint192 _index,string memory _name, string memory _phoneNumber, string memory _email) external {
      require(_index < contacts[msg.sender].length, "Contact does not exist.");
      Contact storage contact =contacts[msg.sender][_index];
      contact.name = _name;
      contact.phoneNumber = _phoneNumber;
      contact.email=_email;

      emit ContactUpdated(msg.sender, _index, _name, _phoneNumber, _email);
      
    }
    function getContact(uint192 _index ) external view returns (string  memory, string  memory, string  memory) {
         require(_index < contacts[msg.sender].length, "Contact does not exist.");
          Contact memory contact =contacts[msg.sender][_index];
          return (contact.name,contact.phoneNumber,contact.email);
      
    }
    function deleteContract(uint192 _index) external{
       require(_index < contacts[msg.sender].length, "Contact does not exist.");

       uint256 lastIndex = contacts[msg.sender].length -1;
       if(_index != lastIndex){
        contacts[msg.sender][_index] = contacts[msg.sender][lastIndex];
       }

       contacts[msg.sender].pop();
       emit ContactDeleted(msg.sender, _index);




      
    }

}