contract lib
{
    struct li
    {
    string bookname;
    uint256 bookid;
    uint256 total;
    uint256 ref;
    }
    mapping(string =>li)li1;
    mapping(string =>mapping(string =>li))li2;
   
function bookreg(string _bookname,uint256 _bookid,uint256 _total)
{
 li1[_bookname].bookname=_bookname;
 li1[_bookname].bookid=_bookid;
 li1[_bookname].total=_total;
}
function bookretun(string _bookname,uint256 _bookid,string stdname)
{
    if(_bookid==li1[_bookname].bookid&&li2[stdname][_bookname].ref==li1[_bookname].bookid)
 {
    li1[_bookname].total+=1; 
    li2[stdname][_bookname].ref=0;
 }
}
function bookavailability(string bookname)public view returns(string,uint256)
{
  if(li1[bookname].total>=1)
    {
        
        
        return("available",li1[bookname].total);
    }
    else
    {
       return("not available",li1[bookname].total);
    }   
}
function booksearch(string bookname,string stdname)  
{
    
    require(li1[bookname].total>=1&&li2[stdname][bookname].ref!=li1[bookname].bookid);
         li1[bookname].total-=1;
        li2[stdname][bookname].ref=li1[bookname].bookid;
    
    
}
}
