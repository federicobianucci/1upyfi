// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {VyperDeployer} from "snekmate-utils/VyperDeployer.sol";

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {MockToken} from "test/mocks/MockToken.sol";

import {IYearnVotingEscrow} from "test/interfaces/IYearnVotingEscrow.sol";
import {IYearnGauge} from "test/interfaces/IYearnGauge.sol";

import {IProxy} from "test/interfaces/IProxy.sol";
import {IStaking} from "test/interfaces/IStaking.sol";
import {IStakingRewards} from "test/interfaces/IStakingRewards.sol";
import {IBasicRedeemer} from "test/interfaces/IBasicRedeemer.sol";
import {IGaugeRewards} from "test/interfaces/IGaugeRewards.sol";
import {IRegistry} from "test/interfaces/IRegistry.sol";
import {ILiquidLocker} from "test/interfaces/ILiquidLocker.sol";
import {IGauge} from "test/interfaces/IGauge.sol";

abstract contract BaseTest is Test {
    VyperDeployer vyperDeployer;

    // yearn
    IERC20 public yfi;
    IERC20 public dYfi;
    IYearnVotingEscrow public yearnVotingEscrow;
    IYearnGauge public yearnGauge1;
    IYearnGauge public yearnGauge2;
    IYearnGauge public yearnGauge3;
    IYearnGauge public yearnGauge4;
    IYearnGauge public yearnGauge5;

    // 1up
    IProxy public proxy;
    IStaking public staking;
    IStakingRewards public stakingRewards;
    IBasicRedeemer public basicRedeemer;
    IGaugeRewards public gaugeRewards;
    IRegistry public registry;
    ILiquidLocker public liquidLocker;
    IGauge public gauge1;
    IGauge public gauge2;
    IGauge public gauge3;
    IGauge public gauge4;
    IGauge public gauge5;

    function setUp() public virtual {
        vyperDeployer = new VyperDeployer();

        //---------- yearn contracts ----------//

        yfi = IERC20(0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e);
        dYfi = IERC20(0x41252E8691e964f7DE35156B68493bAb6797a275);

        yearnVotingEscrow = IYearnVotingEscrow(0x90c1f9220d90d3966FbeE24045EDd73E1d588aD5);

        yearnGauge1 = IYearnGauge(0x7Fd8Af959B54A677a1D8F92265Bd0714274C56a3); // yG-yvCurve-YFIETH
        yearnGauge2 = IYearnGauge(0x28da6dE3e804bDdF0aD237CFA6048f2930D0b4Dc); // yG-yvCurve-dYFIETH-f-f
        yearnGauge3 = IYearnGauge(0x107717C98C8125A94D3d2Cc82b86a1b705f3A27C); // yG-lp-yCRVv2
        yearnGauge4 = IYearnGauge(0x81d93531720d86f0491DeE7D03f30b3b5aC24e59); // yG-yvCurve-yETH-f
        yearnGauge5 = IYearnGauge(0x6130E6cD924a40b24703407F246966D7435D4998); // yG-lp-yPRISMA

        //---------- 1up contracts ----------//

        // proxy
        proxy = IProxy(deployContract("Proxy", abi.encode(address(yfi), address(dYfi))));

        // registry
        registry = IRegistry(deployContract("Registry", abi.encode(address(proxy))));

        // liquid locker
        liquidLocker = ILiquidLocker(
            deployContract("LiquidLocker", abi.encode(address(yfi), address(yearnVotingEscrow), address(proxy)))
        );

        // staking
        staking = IStaking(deployContract("Staking", abi.encode(address(yfi))));

        // staking rewards
        stakingRewards = IStakingRewards(
            deployContract("StakingRewards", abi.encode(address(proxy), address(staking), address(yfi), address(dYfi)))
        );

        // gauge rewards
        gaugeRewards = IGaugeRewards(deployContract("GaugeRewards", abi.encode(address(dYfi), address(registry))));

        // basic redeemer
        basicRedeemer = IBasicRedeemer(
            payable(
                deployContract(
                    "BasicRedeemer",
                    abi.encode(
                        address(yearnVotingEscrow),
                        address(liquidLocker),
                        address(yfi),
                        address(dYfi),
                        address(proxy),
                        address(gaugeRewards),
                        address(stakingRewards)
                    )
                )
            )
        );

        // gauges
        gauge1 = IGauge(
            deployContract(
                "Gauge", abi.encode(address(yearnGauge1), address(proxy), address(dYfi), address(gaugeRewards))
            )
        );
        gauge2 = IGauge(
            deployContract(
                "Gauge", abi.encode(address(yearnGauge2), address(proxy), address(dYfi), address(gaugeRewards))
            )
        );
        gauge3 = IGauge(
            deployContract(
                "Gauge", abi.encode(address(yearnGauge3), address(proxy), address(dYfi), address(gaugeRewards))
            )
        );
        gauge4 = IGauge(
            deployContract(
                "Gauge", abi.encode(address(yearnGauge4), address(proxy), address(dYfi), address(gaugeRewards))
            )
        );
        gauge5 = IGauge(
            deployContract(
                "Gauge", abi.encode(address(yearnGauge5), address(proxy), address(dYfi), address(gaugeRewards))
            )
        );

        vm.label(address(yfi), "YFI");
        vm.label(address(dYfi), "dYFI");
        vm.label(address(0x10000), "Alice");
        vm.label(address(0x20000), "Bob");
        vm.label(address(0x30000), "Deployer");
    }

    function deployContract(string memory contractName, bytes memory args) public returns (address) {
        return vyperDeployer.deployContract("contracts/", contractName, args);
    }
}
