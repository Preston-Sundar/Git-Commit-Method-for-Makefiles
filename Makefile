# If the first argument is "git"
ifeq (git,$(firstword $(MAKECMDGOALS)))
	# Remaining arguments form the commit string
  	GIT_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  	# ...and turn them into do-nothing targets
  	$(eval $(GIT_ARGS):;@:)
endif

# git function to push to repo
git:
	git add *
	git commit -m "$(GIT_ARGS)"
	git push




