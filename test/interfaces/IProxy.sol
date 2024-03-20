// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IProxy {
    event PendingManagement(address management);
    event SetManagement(address management);
    event SetOperator(address indexed operator, bool flag);
    event SetSignedMessage(bytes32 indexed hash, bool signed);

    function accept_management() external;
    function call(address _target, bytes memory _data) external payable;
    function isValidSignature(bytes32 _hash, bytes memory _signature) external view returns (bytes4);
    function management() external view returns (address);
    function messages(bytes32 arg0) external view returns (bool);
    function modify_lock(uint256 _amount, uint256 _unlock_time) external;
    function operators(address arg0) external view returns (bool);
    function pending_management() external view returns (address);
    function set_management(address _management) external;
    function set_operator(address _operator, bool _flag) external;
    function set_signed_message(bytes32 _hash, bool _signed) external;
}
