kill -9 $(ps aux | grep 'evaluatte' | awk '{print $2}')
gunicorn app.wsgi -b 0.0.0.0:8080 --reload --timeout 900 --log-level debug --log-file ~/logs/evaluatte.log --daemon