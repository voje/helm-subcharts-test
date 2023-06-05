# helm-subcharts-test
Testing capabilities of helm subcharts

Locally created charts:

```yaml
amsterdam:
    brussels:
    chicago:
        denver:
    ecatepec: # dependency from local folder
    kube-prometheus-stack: # dependency from the internet
```

Pull dependencies and build a local chart.   
```bash
helm dependency update amsterdam
helm dependency build amsterdam
helm template --debug amsterdam
```
```bash

.
./amsterdam
./amsterdam/charts/brussels
./amsterdam/charts/chicago
./amsterdam/charts/chicago/charts/denver
./amsterdam/charts/chicago/charts/denver/charts
./amsterdam/charts/ecatepec-0.1.0.tgz
./amsterdam/charts/kube-prometheus-stack-46.6.0.tgz
```

Note that `$ helm dep build` is not recursive.   
The chart `brussels` has a dependency (pdmdb-db) which doesn't 
get pulled automatically.   

Parent chart can override child-chart values:
```yaml
# amsterdam/values.yaml

chicago:
  chicago_value_one: "chicago overridden"

  denver:
    denver_value_one: "denver overridden"
```



