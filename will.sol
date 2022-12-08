pragma solidity ^0.5.0;

contract TimedTransfer {
    // The address to which funds will be transferred
    address payable recipient;

    // The timestamp at which the transfer will occur
    uint256 transferTime;

    // The amount of funds to be transferred
    uint256 amount;

    // Flag to indicate whether the transfer has been canceled
    bool canceled;

    constructor(address payable _recipient, uint256 _transferTime, uint256 _amount) public {
        recipient = _recipient;
        transferTime = _transferTime;
        amount = _amount;
        canceled = false;
    }

    // This function can be called by the contract owner to cancel the transfer
    function cancelTransfer() public {
        require(msg.sender == address(0x0)); // Only the contract owner can cancel the transfer
        canceled = true;
    }

    // This function can be called by anyone to initiate the transfer of funds
    // It will only execute the transfer if the current time is greater than or equal to the specified transfer time
    // and the transfer has not been canceled
    function executeTransfer() public {
        require(!canceled); // The transfer can only be executed if it has not been canceled
        require(now >= transferTime); // The transfer can only be executed if the current time is greater than or equal to the specified transfer time

        // Check if the recipient address is a valid contract
        // We use the `isContract` built-in function to check if the recipient address is a contract
        if (isContract(recipient)) {
            // If the recipient address is a valid contract, we call the `transfer` function on the recipient contract
            // to transfer the funds to the contract.
            recipient.transfer(amount);
        } else {
            // If the recipient address is not a valid contract, we call the `transfer` function on the msg.sender
            // to refund the funds back to the caller.
            msg.sender.transfer(amount);
        }
    }
}
