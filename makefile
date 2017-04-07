all:
	@echo "Usage:"
	@echo "	Run :\`make preview\` to preview your blog."
	@echo "	Run :\`make deploy\` to view final state of your blog."
	@echo "	Run :\`make putOnline\` to put your blog online (to github.io)."
	@echo "	Run :\`make write\` write a post."
	@echo "	Run :\`make modify\` modify a post."

# restart jekyll
deploy:
	pkill ruby2.4
	# Will watch the new changed files.
	bundle exec jekyll serve --watch &

preview:
	pkill ruby2.4
	# in draft mode, files in _drafts/ will be see.
	bundle exec jekyll serve --drafts --watch &


putOnline:
	@ ./putOnline.sh



#!/bin/bash

# write post.
write:
	filename=`rake post title=$1|awk '{print $4}'`
	echo ${filename}
	vim ${filename}

# modify some posts.
modify:
	file=`ls _posts/ |grep  -i $1`
	echo ${file}
	exit 0;
	vim _posts/${file}
