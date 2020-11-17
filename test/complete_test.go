package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
	"time"
	"crypto/tls"
)

func TestHelloWorldAppExample(t *testing.T)  {

	t.Parallel()

	opts := &terraform.Options{
		// You should update this relative path to point at your
		// hello-world-app example directory!
		TerraformDir: "../examples/complete",
	}

	// Clean up everything at the end of the test
	defer terraform.Destroy(t, opts)
	terraform.InitAndApply(t, opts)

	elbDnsName := terraform.OutputRequired(t, opts, "elb_dns_name")
	url := fmt.Sprintf("http://%s", elbDnsName)

	expectedStatus := 200
	expectedBody := "Hello, world!"

	maxRetries := 50
	timeBetweenRetries := 10 * time.Second

	// Setup a TLS configuration to submit with the helper, a blank struct is acceptable
	tlsConfig := tls.Config{}

	http_helper.HttpGetWithRetry(
		t,
		url,
		&tlsConfig,
		expectedStatus,
		expectedBody,
		maxRetries,
		timeBetweenRetries,
	)

}
