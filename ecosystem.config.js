module.exports = {
  apps : [{
    name:'api.gae.yavirac.org',
    script: './dist/main.js',
    watch: 'true',
    max_memory_restart:'3000M',
    instances: 1,
    env: {
    	NODE_ENV: 'development',
    },
    env_production: {
   	NODE_ENV: 'production',
    }			
  }]
};
