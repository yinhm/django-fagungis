#!/bin/bash
set -e
# go in your project root
cd %(code_root)s
# set PYTHONPATH to cwd
export PYTHONPATH=`pwd`
# activate the virtualenv
source %(virtenv)s/bin/activate
# start gunicorn with all options earlier declared in fabfile.py
exec %(virtenv)s/bin/gunicorn_django -w %(gunicorn_workers)s \
    --user=%(runner_user)s --group=%(runner_group)s \
    --bind=%(gunicorn_bind)s --log-level=%(gunicorn_loglevel)s \
    --log-file=%(gunicorn_logfile)s 2>>%(gunicorn_logfile)s \
    %(django_project_settings)s
