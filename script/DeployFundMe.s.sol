// SPDX License-Identifier:MIT

pragma solidity 0.8.19;
import {Script} from "../forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelpersConfig} from "./HelpersConfig.s.sol";
contract DeployFundMe is Script {
    function run() external returns (FundMe){
        HelpersConfig helpersConfig = new HelpersConfig();
        address ethUsdPriceFeeed = helpersConfig.activeNetworkConfig();
        vm.startBroadcast();
        FundMe fundMe= new FundMe(ethUsdPriceFeeed);
        vm.stopBroadcast();
        return fundMe;
    }

}