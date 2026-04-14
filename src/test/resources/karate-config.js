function config() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('Entorno activo:', env);
    
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    karate.configure('ssl',
        {trusAll: true}
    );

    var entornos = {
        qa:{
            petstoreBaseUrl: "https://petstore.swagger.io/v2",
            reqresBaseUrl: "https://reqres.in/api",
            reqresApiKey: "reqres_05c6e8f069814142938300661a834c15"
        }
    };

    var config = entornos[env] || entornos['qa'];

    return config;

}