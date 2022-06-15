function fn (){
    var env = karate.env;                       // get sys property of karate.env
    karate.log("karate env is: ", env);

    if(!env) {
        env = 'QA'
    }

    var config = {
        baseUrl: "https://api.realworld.io/api"
    }

    if (env =='QA'){
//    config.baseUrl = "https://api.realworld.io/api";
        config.email = "karate_1@gmail.com",
        config.password = "pukimann"
        config.prefix = Math.random().toString(36).substring(2,7);
    } else if (env =='DEV'){

    }

    var accessToken = karate.callSingle('classpath:/helpers/GetToken.feature', config).token        // Get token
    karate.configure('headers', {Authorization:'Token ' + accessToken})                             //Set token to all test


    return config;
}