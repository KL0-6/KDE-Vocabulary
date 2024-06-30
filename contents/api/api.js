function random_word()
{
    var request = new XMLHttpRequest();
    request.open("GET", "https://random-word-api.vercel.app/api?words=1&alphabetize=true", false);
    request.send();

    // readyState is done AND status is ok
    if(request.readyState == 4 && request.status == 200) 
    {
        var data = JSON.parse(request.responseText);

        return data[0];
    }

    return "ERROR";
}

function define_word(word)
{
    var request = new XMLHttpRequest();
    request.open("GET", "https://api.dictionaryapi.dev/api/v2/entries/en/" + word, false);
    request.send();

    // readyState is done AND status is ok
    if(request.readyState == 4 && request.status == 200) 
    {
        var data = JSON.parse(request.responseText);

        if(data[0] && data[0]["meanings"])
        {
            return data[0]["meanings"];
        }

        return data[0];
    }

    return "ERROR";
}