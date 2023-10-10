// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    
    // Now I want my storage to provide a service 
    // 1) to store notes from everyone (not only one person)
    // 2) to store many notes from a person
    // 3) to let the person see their notes

    //So we need the ownership od a note. We use struct to do that
    struct Note {
        string aNote;
        address noteOwner;
    }

    //now we have to declare this as variable, but we want that many people (addresses) store notes in the contract
    //Hence we will use an array
    Note[] contractNotes;
    

    function writeNote (string memory _note) public {
        contractNotes.push(Note({aNote:_note,
                                noteOwner:msg.sender
                                }));
    }

    function readMyNotes() view public returns (string[] memory) {
        //I cannot use dynamic memory array so first I calculate th size of temporary array
        uint arraySize = 0;
        for (uint i=0; i < contractNotes.length; i++) {
            if (contractNotes[i].noteOwner==msg.sender){
                arraySize+=1;
            }
        }
        
        string[] memory myNotes = new string[](arraySize);
        uint j =0;
        for (uint i=0; i < contractNotes.length; i++) {
            if (contractNotes[i].noteOwner==msg.sender){
                myNotes[j] = contractNotes[i].aNote;
                j+=1;
            }
        }
        return myNotes;

    }
    

}