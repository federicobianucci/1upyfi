// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

interface IFactory {
    event DeployGauge(address indexed ygauge, address gauge);
    event PendingManagement(address management);
    event SetGaugeBlueprint(address blueprint);
    event SetManagement(address management);

    function accept_management() external;
    function deploy_gauge(address _ygauge) external returns (address);
    function gauge_blueprint() external view returns (address);
    function management() external view returns (address);
    function pending_management() external view returns (address);
    function proxy() external view returns (address);
    function registry() external view returns (address);
    function reward_token() external view returns (address);
    function rewards() external view returns (address);
    function set_gauge_blueprint(address _blueprint) external;
    function set_management(address _management) external;
    function yearn_registry() external view returns (address);
}
