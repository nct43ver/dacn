module.exports = {
  future: {
    webpack5: false,
  },
  
  // env: {
  //   NODE_ENV: 'development',
  //   DEBUG: 'custom:*'
  // },

  apps: [{
      name: 'yarn',
      script: 'yarn',
      args: 'dev',
      interpreter: '/bin/bash',
      env: {
        NODE_ENV: 'development'
      }
    }],

};
