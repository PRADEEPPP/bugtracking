component {
    url.returnformat="json";
    remote function getEvents()
    {
        var q=new query();
        q.setDatasource("bugTracking"); 
        q.setSQL("select bugName, estimatedEndDate from projects");
        var dbresults=q.execute().getResult();
        var results=[];
        for(var i=1;i<= dbresults.recordCount;i++)
        {
            arrayAppend(results,{
                "title"=dbresults.bugName[i],
                "start"=dbresults.estimatedEndDate[i]
            });
        }
        return results;
    }
}