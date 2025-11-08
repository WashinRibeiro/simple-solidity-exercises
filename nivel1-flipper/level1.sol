// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Flip {
    bool public state;

    event StateChanged(bool newState);

    function flip() public {
        state = !state;
        emit StateChanged(state);
    }
}
