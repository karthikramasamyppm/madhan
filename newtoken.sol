pragma solidity ^0.4.0;
 import "./Erc20.sol";
contract tokensupply is Token
{
    struct bk
    {
     uint256 balance;
     }
    string public name;                  
    uint8 public decimals;               
    string public symbol; 
      mapping(address => bk)bk1;
       mapping(address=>mapping(address => uint256))bk2;
  function tokensupply()
  {
       name = "raj";                        
        decimals = 0;                          
        symbol = "mr";  
  }
      function totalSupply(uint256 depo)returns(uint)
    {
        bk1[msg.sender].balance=depo;
        return bk1[msg.sender].balance;
    }
    function transfer(address reciver,uint256 transferamt) public returns(uint256)
    {
        if (bk1[msg.sender].balance >= transferamt && transferamt > 0) {
        require(bk1[msg.sender].balance>transferamt);
        bk1[reciver].balance+=transferamt;
        bk1[msg.sender].balance-=transferamt;
        Transfer(msg.sender, reciver, transferamt);
        return bk1[reciver].balance;
        }
    }
     function approve(address _spender, uint256 _value) returns (bool success) {
        
        bk2[msg.sender][_spender] = _value;
         Approval(msg.sender, _spender, _value);
        return true;
    }
    function allowance(address _owner,address _spender) constant returns (uint256 remaining) 
   {
      return bk2[_owner][_spender];
   }
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) 
    {
       if (bk2[msg.sender][_from] >= _value && _value > 0) 
       {
           bk1[_to].balance += _value;
            bk1[msg.sender].balance -= _value;
            bk2[msg.sender][_from] -= _value;
            
            return true;
        } 
        else 
        {
            return false; 
            
        }
    }
    function balanceOf(address _owner) constant returns (uint256 balance)
    {
        return bk1[_owner].balance;
    }
}
