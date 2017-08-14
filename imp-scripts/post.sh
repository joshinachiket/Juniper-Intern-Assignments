curl -X POST \
  http://10.84.23.35:8880/v2/apps \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
  "id": "mongo1",
  "cmd" : "ping 1.1.1.1",
  "cpus": 0.3,
  "mem": 256,
  "disk": 0,
  "instances": 1,
  "container": {
    "type": "MESOS",
    "volumes": [],
    "docker": {
      "image": "alpine",
      "forcePullImage": true
    }
  },
  "ipAddress": {
    "networkName": "contrail-cni-plugin",
    "labels": {
      "networks": "blue-network",
      "network-subnets": "5.5.5.0/24",
      "project-name": "default-project",
      "domain-name": "default-domain"
    }
  }
}' 
