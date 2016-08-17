module.exports = {
  routes: {
    Jashboard: {
      path: ['/dashboard'],
      method: 'get',
      page: './pages/dashboard',
    },
    HelloWorld: {
      path: ['/'],
      method: 'get',
      page: './pages/hello-world',
    },
  },
};
