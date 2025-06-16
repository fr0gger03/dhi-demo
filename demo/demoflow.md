# Base Node app - preoptimization

Build your image:
```docker image build -t demonstrationorg/ttwyman-dhi-demo-nodeapp:v1  --sbom=true --provenance=mode=max .```

Get a quick overview of vulnerabilities:
```docker scout quickview demonstrationorg/ttwyman-dhi-demo-nodeapp:v1```

Show recommendations for base image:
```docker scout recommendations demonstrationorg/ttwyman-dhi-demo-nodeapp:v1```

Show corporate policy violations:
```docker scout policy demonstrationorg/ttwyman-dhi-demo-nodeapp:v1 --org demonstrationorg```

# Migrate to DHI

Build image with DHI base:
```docker image build -f Dockerfile.dhi -t demonstrationorg/ttwyman-dhi-demo-nodeapp:v2  --sbom=true --provenance=mode=max .```

Get a quick overview of vulnerabilities:
```docker scout quickview demonstrationorg/ttwyman-dhi-demo-nodeapp:v2```

Show recommendations for base image:
```docker scout recommendations demonstrationorg/ttwyman-dhi-demo-nodeapp:v2```

Show corporate policy violations:
```docker scout policy demonstrationorg/ttwyman-dhi-demo-nodeapp:v2 --org demonstrationorg```

# Optimize with a multi-stage build:

Review and build using a multi-stage build process:
```docker image build -f Dockerfile.multidhi -t demonstrationorg/ttwyman-dhi-demo-nodeapp:v3  --sbom=true --provenance=mode=max .```

Get a quick overview of vulnerabilities:
```docker scout quickview demonstrationorg/ttwyman-dhi-demo-nodeapp:v3```

Show recommendations for base image:
```docker scout recommendations demonstrationorg/ttwyman-dhi-demo-nodeapp:v3```

Show corporate policy violations:
```docker scout policy demonstrationorg/ttwyman-dhi-demo-nodeapp:v3 --org demonstrationorg```