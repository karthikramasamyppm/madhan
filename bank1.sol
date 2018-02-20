contract bank
{
    struct bk
    {
        uint256 trancamt;
        uint256 balance;
        uint256 recvamt;
     }
    mapping(address => bk)bk1;
    address owner=msg.sender;
     address transferowner1=msg.sender;
    uint256 amount;
    modifier md(uint256 transferamt)
    {
        require((owner==msg.sender)&&(amount>transferamt));
        _;
    }
    modifier md1(uint256 transferamt)
    {
        require((transferowner1==msg.sender)&&(amount>transferamt));
        _;
    }
    function deposit(uint256 depo)
    {
        amount=depo;
    }
    function transaction(address reciver,uint256 transferamt)md(transferamt) public
    {
        
        //amount=amount1;
        bk1[owner].trancamt=bk1[owner].trancamt+transferamt;
        bk1[reciver].trancamt=bk1[reciver].trancamt+transferamt;
        bk1[owner].balance=amount-bk1[owner].trancamt;
        amount=amount-transferamt;
        bk1[reciver].balance=bk1[reciver].recvamt+bk1[reciver].trancamt;
        
    }
    
    function transownership(address transferowner,address reciver,uint256 trancamt)md1(trancamt) public
    {
        transferowner1=transferowner;
        transferowner1=owner;
        //transferowner1=msg.sender;
        bk1[transferowner1].trancamt=trancamt;
        bk1[reciver].trancamt=bk1[reciver].trancamt+trancamt;
        amount=amount-bk1[transferowner1].trancamt;
         bk1[reciver].balance=bk1[reciver].recvamt+bk1[reciver].trancamt;
        
        bk1[transferowner1].balance=bk1[transferowner1].balance-trancamt;
    }
    function balance(address balcheck)public view returns(uint256)
    {
        return bk1[balcheck].balance;
    }
}
