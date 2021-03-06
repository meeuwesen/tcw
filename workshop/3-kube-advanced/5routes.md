Services provide internal abstraction and load balancing within OpenShift. Sometimes clients (users, systems, devices, etc.) **outside** of the cluster need to access an application. The way that external clients are able to access applications running in OpenShift is through the _Route_ resource. The default OpenShift router (HAProxy) uses the HTTP header of the incoming
request to determine where to proxy the connection.

By default OpenShift is configured to create the _Route_ based on the service name being exposed and the project where the application lives, adding a common sub-domain configured at the platform level.

So let's expose the `stock-con` service (via CLI, so back to the Terminal), using the following command to create a _Route_:

`oc expose service stock-con --port=9898`{{execute}}

Yay! Now that we know how to create a _Route_, let's verify that the  application is really available at the URL shown in the
web console. So first go back to the "Dashboard" tab and make sure you're in the `dok-stock` project. Find the `stock-con` app and above it you should see an URL that looks something like the following:

```
http://stock-con-dok-stock.2886795338-80-simba02.environments.katacoda.com/
```

Let's try to get data from the service; just append `average/NYSE:RHT` to the URL you gleaned in the previous step, so you end up with something like the following (go back to the Terminal tab to execute this):

`curl http://stock-con-dok-stock.2886795338-80-simba02.environments.katacoda.com/average/NYSE:RHT`

Of course, since this is a public service now, you can also paste the full URL (including the path) into your browser and you should see the same result.
