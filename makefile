profile:
	python -m cProfile \
		-s cumulative \
		-o cprofile.stats \
		main.py

line-profile:
	kernprof -l -v main.py

mem-profile:
	python -m memory_profiler main.py
	mprof run -o mprofstats.dat main.py 

viz-cpu: profile
	snakeviz cprofile.stats

viz-mem: mem-profile
	mprof plot -o viz-mem.jpeg mprofstats.dat

run:
	time --verbose python main.py


# for profilling a running process
run-rasa-server:
	cd bot && \
	rasa run --enable-api -vv

run-action-server:
	cd bot && \
	rasa run actions -vv

get-rasa-server-pid:
	ps -AF  | \
		grep python | \
		grep rasa | \
		grep -v 'actions' | \
		tr -s " " | \
		cut -d " " -f 2

PID_RASA=123
spy-rasa-server:
	py-spy top --pid $$PID_RASA

graph-rasa-server:
	py-spy record -o profile.svg --pid $$PID_RASA