import "./standardtoken1.sol";
contract ERC20Token is StandardToken {

    function () 
    {
        throw;
    }
    string public name;                  
    uint8 public decimals;               
    string public symbol;                 
    string public version = 'H1.0';       
    function ERC20Token()
    {
        balances[msg.sender] = 10000;               // Give the creator all initial tokens (100000 for example)
        totalSupply = 10000;                        // Update total supply (100000 for example)
        name = "mohanraj";                                   // Set the name for display purposes
        decimals = 0;                            // Amount of decimals for display purposes
        symbol = "ww";                               // Set the symbol for display purposes
    }
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}
