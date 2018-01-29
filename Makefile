NAME=spintest
VERSION=1.0.0
REVISION=0
PREFIX=/app/nate-test
TARGET_DIR=.
PACKAGE=$(NAME)-$(VERSION)-$(REVISION).x86_64.rpm
POSTINSTALL=postinstall.sh

.PHONY: package

clean:
	@rm -f $(PACKAGE) || true

test:
	@gem list rspec >/dev/null 2>&1 || gem install rspec --no-ri --no-rdoc 	
	@rspec

package: clean
	@fpm -s dir -t rpm -n $(NAME) -v $(VERSION) --iteration $(REVISION) --prefix $(PREFIX) -C $(TARGET_DIR) --after-install $(POSTINSTALL) . | grep -v 'no value for epoch'

contents: package
	@echo
	@echo Contents of the delivered RPM
	@echo ==============================
	@rpm -ql --package $(PACKAGE)

publish: package
	curl -u "$(USER):$(PASSWORD)" -F "data=@$(PACKAGE)" https://hub.comcast.net/svc/api/v1/automation/noarch/7/

unpublish: package
	curl -u "$(USER):$(PASSWORD)" -X DELETE  https://hub.comcast.net/svc/api/v1/automation/noarch/7/$(PACKAGE)
