# Overall demo flow

## Base Node app - before optimization

### Local Repo - Build and Scan

Build your image:
```docker image build -t demonstrationorg/ttwyman-dhi-demo-nodeapp:v1  --sbom=true --provenance=mode=max .```

Get a quick overview of vulnerabilities:
```docker scout quickview demonstrationorg/ttwyman-dhi-demo-nodeapp:v1```

### Show Image CVEs

Show recommendations for base image:
```docker scout recommendations demonstrationorg/ttwyman-dhi-demo-nodeapp:v1```

Show Express CVEs
```docker scout cves --only-package express demonstrationorg/ttwyman-dhi-demo-nodeapp:v1```

Show corporate policy violations:
```docker scout policy demonstrationorg/ttwyman-dhi-demo-nodeapp:v1 --org demonstrationorg```

### Show Docker Desktop

- Show local repo
- Demonstrate Scout results in dashboard / repo
- Illustrate that same information is shown as at the CLI

## Migrate to DHI

### Remediate base image

Update local repo with updated version of express (don't forget to show updated package.json):
```npm install express@4.21.2 --save```

Build image with DHI base (explain how this simulates updating the Dockerfile):
```docker image build -f Dockerfile.dhi -t demonstrationorg/ttwyman-dhi-demo-nodeapp:v2  --sbom=true --provenance=mode=max .```

Get a quick overview of vulnerabilities:
```docker scout quickview demonstrationorg/ttwyman-dhi-demo-nodeapp:v2```

Show recommendations for base image:
```docker scout recommendations demonstrationorg/ttwyman-dhi-demo-nodeapp:v2```

Show Express CVEs
```docker scout cves --only-package express demonstrationorg/ttwyman-dhi-demo-nodeapp:v2```

Show corporate policy violations:
```docker scout policy demonstrationorg/ttwyman-dhi-demo-nodeapp:v2 --org demonstrationorg```

- note the policy violation for unsupported base image

## Optimize with a multi-stage build

Review and build using a multi-stage build process:
```docker image build -f Dockerfile.multidhi -t demonstrationorg/ttwyman-dhi-demo-nodeapp:v3  --sbom=true --provenance=mode=max .```

Get a quick overview of vulnerabilities:
```docker scout quickview demonstrationorg/ttwyman-dhi-demo-nodeapp:v3```

Show corporate policy violations:
```docker scout policy demonstrationorg/ttwyman-dhi-demo-nodeapp:v3 --org demonstrationorg```
