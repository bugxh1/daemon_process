# daemon_process
```bash
wget https://raw.githubusercontent.com/bugxh1/daemon_process/main/daemon_process.sh
chmod +x daemon_process.sh
./daemon_process.sh -p "xray_linux_amd64" -c "./xray_linux_amd64 webscan --listen 0.0.0.0:7777 --html-output $RANDOM.html --webhook-output http://127.0.0.1:5000/webhook "
./daemon_process.sh -p "w13scan.py" -c "python3 w13scan.py -s 0.0.0.0:7778 --html"

./daemon_process.sh -p "celery" -c "celery -A tasks worker -l info -n worker@%h1 -c 10"
./daemon_process.sh -p "celery" -c "celery -A tasks worker -l info -n worker@%h2 -c 10"
```
