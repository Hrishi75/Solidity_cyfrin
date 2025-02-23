
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

//why is this a library and not abstract?
//why not an interface?

library PriceConverter {
    //we could make this public but then we'd have to deploy it
    function getPrice() internal view returns  (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
               //seplio eth / usd address 
        );
        (, int256 answer, , , ) = priceFeed.latestRoundData();
             //eth/usd rate in 18 digit
             return uint256(answer * 10000000000);
        
    }
     function getConversionRate(
        uint256 ethAmount 
     ) internal view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = ethPrice * ethAmount / 1000000000000000000;
        // the actual Eth/USD conversion rate , after adjusting the extra 0s.
        return ethAmountInUsd;
     }
}

// agrregatorv3 sol file for reference 
// pragma solidity ^0.8.0;

// // solhint-disable-next-line interface-starts-with-i
// interface AggregatorV3Interface {
//   function decimals() external view returns (uint8);

//   function description() external view returns (string memory);

//   function version() external view returns (uint256);

//   function getRoundData(
//     uint80 _roundId
//   ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

//   function latestRoundData()
//     external
//     view
//     returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
// }