// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;


contract Arrays {
    //creating an array
    uint256[] public s_numbersArray; //dynamic size array
    uint256[] public s_numbersArray2 = [1,2,3]; //dynamic size array with some values
    string[25] private s_studentsArray; //25 cells in this array fixed size
    uint256[][3] public s_arrayOfThreeDynamicArrays;


    function getStudent (uint256 studentID) public view returns(string memory){
        return s_studentsArray[studentID];
    }

    function addStudent (string memory _studentName, uint256 _studentID) public {
        s_studentsArray[_studentID] = _studentName;
    }

    function addNumberToArray (uint256 _number) public {
        s_numbersArray.push(_number);
        s_numbersArray2.push(_number);
    }

    function removeLastElement() public {
        s_numbersArray.pop();
        s_numbersArray2.pop();
        
    }

    function removeByIndex(uint256 _index) public {
        delete s_numbersArray[_index]; //this does not change the length of an array! It sets the value to default for the type
        delete s_numbersArray2[_index];
    }

    function lengthOfArrays() public view returns (uint256,uint256){
        return (s_numbersArray.length,s_numbersArray2.length);
    }
}