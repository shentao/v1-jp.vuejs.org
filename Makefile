update:
	rm db.json
	node_modules/.bin/hexo generate
	cp -R ./todomvc public/examples

deploy: update
	node_modules/.bin/hexo deploy

test:
	npm test

bump:
	cd ../vue && \
		git checkout -- dist && \
		git checkout v1.0.28 && \
		npm run build && \
		npm run build-test > /dev/null
	cp ../vue/dist/vue.min.js themes/vue/source/js/vue.min.js
	cp ../vue/dist/vue.js themes/vue/source/js/vue.js
	node update.js
