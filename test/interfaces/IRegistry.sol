// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IRegistry {
    event Deregister(address indexed gauge, address indexed ygauge, uint256 indexed idx);
    event Disable(address indexed ygauge, bool disabled);
    event NewIndex(uint256 indexed old_idx, uint256 new_idx);
    event PendingManagement(address management);
    event Register(address indexed gauge, address indexed ygauge, uint256 idx);
    event SetManagement(address management);
    event SetRegistrar(address registrar);

    function accept_management() external;
    function deregister(address _gauge, uint256 _idx) external;
    function disable(address _ygauge, bool _disabled) external;
    function disabled(address _ygauge) external view returns (bool);
    function gauge_map(address arg0) external view returns (address);
    function gauge_registered(address _gauge) external view returns (bool);
    function gauges(uint256 _idx) external view returns (address);
    function management() external view returns (address);
    function num_gauges() external view returns (uint256);
    function pending_management() external view returns (address);
    function proxy() external view returns (address);
    function register(address _gauge) external returns (uint256);
    function registrar() external view returns (address);
    function set_management(address _management) external;
    function set_registrar(address _registrar) external;
    function ygauge_registered(address _ygauge) external view returns (bool);
    function ygauges(uint256 arg0) external view returns (address);
}
