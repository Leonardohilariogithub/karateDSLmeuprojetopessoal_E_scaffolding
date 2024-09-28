function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    config.url = "https://serverest.dev";
  } else if (env == 'qa') {
    config.url = "https://serverest.dev";
  }
  return config;
}