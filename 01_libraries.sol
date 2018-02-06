//Code snippets for blog post on using libraries with

pragma solidity ^0.4.18;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

library SafeMath {
  [code is here]
}

contract myCoolToken {
  using SafeMath for uint;
  [code goes here]
}


//Solidity

function transferTokens (address _from, address _to, uint amount) {
  //must have enough funds
  require(balances[_from] >= amount);
  //here we protect ourselves against overflows
  //by verifying that the addition does not result
  //in a wrap-around (thus making the result < the result)
  uint result = balances[_to] + amount;
  assert(result >= amount);
  balances[_to] += amount;
  balances[_from] -= amount;

}


function transferTokens (address _from, address _to, uint amount) {
  //below the add method of the SafeMath library verifies that there is no overflow
  //balances[_from] become the first argument "a" and amount is the second argument "b"
  //it reverts the transaction if an error is found
  //if there are no error it returns the addition
  balances[_to] = balances[_to].add(amount);
  //below we can remove the require since the sub method of the
  //SafeMath library is going to take care of making sure there are enough funds
  balances[_from] = balances[_from].sub(amount);

}
