/*
   *******************************************************
   *                                                     *
   *             ACS Contract Audit Program              *
   *   _______________________________________________   *
   *                                                     *
   *   A structured path for auditors and bug bounty      *
   *   hunters to learn by finding and reporting          *
   *   vulnerabilities in smart contracts.                *
   *                                                     *
   *   Level: Beginner                                    *
   *   Special thanks: Aniket Tyagi                       *
   *                                                     *
   *******************************************************
*/


/*
ZZZZZ   EEEEE   RRRRR    OOO    V   V    AAAAA   U   U  L        TTTTT
Z   E       R    R  O   O   V   V   A     A  U   U  L          T  
Z    EEEEE   RRRRR   O   O   V   V  AAAAAAAA  U   U  L          T  
Z     E       R   R   O   O    V V   A     A   U   U  L          T  
ZZZZZ   EEEEE   R    R   OOO      V    A     A    UUU   LLLLL      T  
ACS Contract Audit Program - ZerVault 0x1
*/

/////////////////////////////////////////////////////////////////////////////////

// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Zerovault} from "../src/zerovault.sol";

contract ZeroVaultScript is Script {
    Zerovault public zerovault;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        address owner = 0x1234567890AbcdEF1234567890aBcdef12345678;

        zerovault = new Zerovault(owner);
        console.log("Deployed Address", address(zerovault));

        vm.stopBroadcast();
    }
}
