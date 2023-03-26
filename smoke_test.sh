            URL=$(kubectl get svc capstoneadlrm-microservice-1234 -o wide | awk '{print $4}' | tail -n 1)         
            echo ${URL} 
            if curl -s ${URL}:8000 | grep "Hellos World!"
            then
              exit 0
            else
              exit 1
            fi