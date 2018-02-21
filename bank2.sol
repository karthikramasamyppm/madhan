contract bank
{
    struct bk
    {
        uint256 trancamt;
        uint256 balance;
        uint256 recvamt;
     }
    mapping(address => bk)bk1;
    mapping(uint256 => bk)bk2;
    address owner1;
    address owner=owner1;
    address transferowner1=msg.sender;
    uint256 amount;
    uint256 a;
    modifier md(uint256 transferamt)
    {
        require((owner1==msg.sender)&&(amount>transferamt));
        a=1;
        _;
    }
    modifier md1(uint256 transferamt)
    {
        require((transferowner1==msg.sender)&&(amount>transferamt));
        _;
    }
    function ownership()public
    {
        owner1=msg.sender;
        
    }
    function deposit(uint256 depo)
    {
        amount=depo;
    }
    function transaction(address reciver,uint256 transferamt)md(transferamt) public
    {
        //amount=amount1;
        
        bk2[a].trancamt=bk2[a].trancamt+transferamt;    
        bk1[reciver].trancamt=bk1[reciver].trancamt+transferamt;
        bk2[a].balance=amount-bk2[a].trancamt;
        amount=amount-transferamt;
        bk1[reciver].balance=bk1[reciver].recvamt+bk1[reciver].trancamt;
        
    }
    
    function transownership(address transferowner,address reciver,uint256 trancamt)md(trancamt) public
    {
        
        transferowner1=transferowner;
        transferowner1=owner;
        //transferowner1=msg.sender;
        bk2[a].trancamt=trancamt;
        bk1[reciver].trancamt=bk1[reciver].trancamt+trancamt;
        amount=amount-bk2[a].trancamt;
         bk1[reciver].balance=bk1[reciver].recvamt+bk1[reciver].trancamt;
        
        bk2[a].balance=bk2[a].balance-trancamt;
    }
    function balance(address balcheck)public view returns(uint256)
    {
        if(balcheck==msg.sender)
        {
        return bk2[a].balance;
        }
        else
        {
              return bk1[balcheck].balance;
        }
}
}
