contract sale
{
    struct sal
    {
        string name;
        uint256 no;
        uint256 id;
        uint256 cust;
        uint256 time;
    }
    uint256 c;
    uint256 []d;
    mapping(string => sal)ma;
    mapping(string =>mapping(string => sal))ma1;
    mapping(string =>mapping(uint256 => sal))ma2;
    function product(uint256 _id,string _name,uint256 _no)
    {
        ma[_name].name=_name;
        ma[_name].no=_no;
        ma[_name].id=_id;
        c++;
    }
    function booking(string cus,string proname)
    {
        if(ma1[cus][proname].cust!=ma[proname].id)
        {
        ma1[cus][proname].cust=ma[proname].id;
        ma[proname].no-=1;
        ma1[cus][proname].time=now;
        }
    }
    function confirm(string cus,string proname)returns(string,uint256)
    {
        if(ma1[cus][proname].cust==ma[proname].id&&(now-ma1[cus][proname].time)<10)
        {
            ma2[cus][ma[proname].id].id=ma[proname].id;
            return("your product is sucessfully ordered",ma2[cus][ma[proname].id].id);
        }
        else
        {
            ma[proname].no+=1;
            return ("your product is not sucessfully ordered",ma2[cus][ma[proname].id].id);
        }
    }
    function cusdetals(string cus)public view returns(uint256[])
    {
       
        for(uint256 i=111;i<111+c;i++)
        {
            if(ma2[cus][i].id==i)
            {
            d.push(ma2[cus][i].id);
            }
        }
        return d;
    }
    function prodetails(string pro)public view returns(uint256)
    {
        return ma[pro].no;
    }
}
