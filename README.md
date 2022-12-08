# Smart-Contract-Will
Here is a simple example of a Solidity contract that can transfer funds to a specified address at a specified time and date

In this updated version of the contract, the cancelTransfer function checks if the caller of the function is the contract owner by comparing the msg.sender address with the placeholder address 0x0. The executeTransfer function also uses the isContract built-in function to check if the recipient address is a valid contract. If the recipient address is not a valid contract, it will refund the funds back to the caller using the transfer function on the msg.sender address.

To use this contract, deploy it with the constructor parameters specifying the recipient address, the transfer time, and the amount of funds to be transferred. Then, call the executeTransfer function to initiate the transfer of funds. If you want to cancel the transfer, call the cancelTransfer function before the transfer time. If the recipient address is invalid or the transfer fails for any other reason, the funds will be refunded to the caller of the executeTransfer function.
